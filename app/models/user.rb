# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  company            :string
#  current_sign_in_at :datetime
#  current_sign_in_ip :string
#  displayname        :string
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :string
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :string
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  # == Attributes =====================================
  alias_attribute :employeeid, :employee_id

  # == Concerns =======================================
  # include QueryCaches

  # == Constants ======================================

  # == Extensions =====================================
  # enforce CASino authentication
  devise :cas_authenticatable, :timeoutable

  # == Relationships ==================================
  belongs_to :employee, primary_key: :employee_id, foreign_key: :employee_id, optional: true

  # == Validations ====================================
  # ensure a valid username is returned from CASino
  # => And that when authenticating use a case-insensitive comparison.
  # => Because some people are USERname and others are username.
  # => And when people switch position types these alpha characteraztions can change
  validates :username, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  # For displaying the current users name (Smith, John)  (this is passed from CASino)
  validates :displayname, presence: true
  validates :employee_id, presence: true

  # == Scopes =========================================

  # == Callbacks ======================================

  #after_update do
    # Invalidate caches, involving users when a change has been made
  #invalidate_user_index_row(self.username)
  #end

  # == ClassMethods ===================================
  # Update additional user attributes passed from CASino
  # => You can update/add any attributes passed from CASino using this method.
  def cas_extra_attributes=(extra_attributes)
    extra_attributes.each do |name, value|
      case name.to_sym
      when :company
        self.company = determine_company(value)
      when :displayname
        self.displayname = value
      when :employeeid
        self.employee_id = value
      when :memberof
        # Verify if the person hitting the app is part of devgroup
        self.superuser = value.include?('CN=devgroup,OU=UNMH_IT_Admin,OU=Group,OU=UNMH,DC=health,DC=unm,DC=edu')
        # If they are part of HR they should automatically be assigned HR Access
        #   First HR group is for UH HR the second HR group is for SRMC HR
        #self.hr_access = value.include?('CN=HR,OU=HOPE,OU=Group,OU=UNMH,DC=health,DC=unm,DC=edu') || value.include?('CN=SRMC-HR,OU=Security Groups,OU=SRMC,DC=health,DC=unm,DC=edu')
      end
    end
    # When the user logs in, verify if they have manager access or not.
    # => This is set for when they login because people change departments, access levels, etc.
    # => This is a number, because someone can be a manager, director, etc of multiple departments at any given time
    #is_manager = Manager.verify_if_manager?(username)
      #self.manager_access = (is_manager.positive? ? true : false)
  end

  # Create app users when they haven't logged in to Tuition Reimbursement app yet
  def self.from_employee(ldapid)
    employee = Employee.where(:ldapid => ldapid).first
    u = User.new(:username => employee.ldapid, :displayname => employee.full_name, :superuser => false, :employee_id => employee.employee_id, :company => 'UNMH')
    u.save
    u
  end
  # By default sort users by lower(displayname)
  ransacker :name_case_insensitive, type: :string do
    arel_table[:displayname].lower
  end

  # == InstanceMethods ================================

  # Determine which company Abbreviation the employee is associated with
  # @param company [String] the Compny name in which the employee is associated with in LDAP
  # @return [String] the organizations Abbreviation in which the employee is associated with
  def determine_company(company = '')
    return '' if company.blank?

    # If multiple companies are returned for the user (this usually happens with Administrators)
    company = company.first if company.is_a?(Array)

    case company
    when 'Health Sciences Center'
      'HSC'
    when 'Sandoval Regional Medical Center', 'Health Sciences Center and Sandoval Regional Medical Center'
      'SRMC'
    when 'UNM Hospitals', 'Health Sciences Center and UNM Hospitals', 'UNMH Board'
      'UNMH'
    when 'UNM Medical Group', 'UNM Medical Groups', 'Health Sciences Center and UNM Medical Group'
      'UNMMG'
    else
      ''
    end
  end



  ########################################
  ### Access Control
  ########################################
  def manager?
    manager_access
  end

  def superuser?
    superuser
  end

  # Admin access is usually assigned to someone who can modify perms for other individuals
  # This is usually to someone in HR who manages who has access to datashare
  def admin?
    superuser? || admin_access
  end

  # Determine if someone has access to FTEbudget reporting and uploads

  def hraccess?
    superuser? || hr_access
  end

  def manager_access?
    superuser? || manager_access
  end


  ########################################
  # HR Access by Organization
  ########################################
  def srmc_hraccess?
    hraccess? && employed_by_srmc?
  end

  def uh_hraccess?
    hraccess? && employed_by_unmh?
  end

  ########################################
  # Company Access
  #   To determine if the employee is part of the specified organization
  ########################################
  def employed_by_hsc?
    company == 'HSC'
  end

  def employed_by_srmc?
    company == 'SRMC'
  end

  def employed_by_unmh?
    company == 'UNMH'
  end
end
