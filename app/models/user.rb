# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  company            :string(4000)
#  current_sign_in_at :datetime
#  current_sign_in_ip :string(4000)
#  displayname        :string(4000)
#  email              :string(4000)
#  hr_access          :boolean
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :string(4000)
#  manager_access     :boolean
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :string(4000)     not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :string(4000)
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  # == Relationships ==================================
  has_one :employee, primary_key: :employee_id, foreign_key: :employee_id
  has_many :goals
  accepts_nested_attributes_for :goals
  has_many :courses, through: :goals, class_name: 'Course'
  has_many :credentials, through: :goals, class_name: 'Credential'
  has_many :schools, through: :goals, class_name: 'School'
  has_many :impressions
  has_many :active_goals, -> { where(active: true) }, class_name: 'Goal'
  has_many :approved_courses, -> { where(status: 'approved') }, class_name: 'Course'
  has_many :pending_courses, -> { where(status: 'pending') }, class_name: 'Course'
  has_many :reimbursed_courses, -> { where(status: 'reimbursed') }, class_name: 'Course'

  # == Attributes =====================================
  alias_attribute :employeeid, :employee_id
  alias_attribute :ldapid, :username

  # == Validations ====================================
  # ensure a valid username is returned from CASino
  # => And that when authenticating use a case-insensitive comparison.
  # => Because some people are USERname and others are username.
  # => And when people switch position types these alpha characteraztions can change
  validates :username, presence: true, length: { minimum: 2 }, uniqueness: { case_sensitive: false }
  # For displaying the current users name (Smith, John)  (this is passed from CASino)
  validates :displayname, presence: true
  validates :employee_id, presence: true

  # == Concerns =======================================
  # include QueryCaches

  # == Extensions =====================================
  # enforce CASino authentication
  devise :cas_authenticatable, :timeoutable

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
      when :email
        self.email = value
      when :memberof
        # Verify if the person hitting the app is part of devgroup
        self.superuser = value.include?('CN=devgroup,OU=UNMH_IT_Admin,OU=Group,OU=UNMH,DC=health,DC=unm,DC=edu')
        # If they are part of HR they should automatically be assigned HR Access
        # First HR group is for UH HR the second HR group is for SRMC HR - commented out for now as this is a UNMH Employee benefit app
        self.hr_access = (employee_id.blank? ? false : self.employee.benefits_team?)
          # value.include?('CN=HR,OU=HOPE,OU=Group,OU=UNMH,DC=health,DC=unm,DC=edu') # || value.include?('CN=SRMC-HR,OU=Security Groups,OU=SRMC,DC=health,DC=unm,DC=edu')
        # When the user logs in, verify if they have manager access or not.
        # => This is set for when they login because people change departments, access levels, etc.
        self.manager_access = (employee_id.blank? ? false : Employee.where(manager_id: self.employee_id).exists?)
      end
    end
  end

  def self.course_count
    Course.where(user_id: user.id).count
  end

  # Check Tuition Reimbursement Credits left in fiscal year
  def credits_left_this_year
    (employee.max_credits_per_year - credits_used_this_year)
  end

  # Create app users when they haven't logged in to Tuition Reimbursement app yet
  def self.from_employee(ldapid)
    employee = Employee.find_by(ldapid: ldapid)
    u = User.new(username: employee.ldapid, displayname: "#{employee.first_name} #{employee.last_name}", superuser: false, hr_access: employee.benefits_team?, employee_id: employee.employee_id, email: employee.email, company: 'UNMH')
    u.save
    u
  end

  # By default sort users by lower(displayname)
  ransacker :name_case_insensitive, type: :string do
    arel_table[:displayname].lower
  end

  # == InstanceMethods ================================
  # Determine which company Abbreviation the employee is associated with
  # @param company [String] the Company name in which the employee is associated with in LDAP
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

  # go to HR payroll and get the subordinates of the current user - see employee has_many relationship 'subordinates'
  def subordinates
    self.employee.subordinates
  end

  # find the in-app users who are subordinates of the manager by using the employee id in the User table
  def subordinate_users
    subs = subordinates.pluck(:employee_id)
    User.where(employee_id: subs)
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

  # Admin access gives access to additional routes to administrate data settings
  def admin?
    superuser? || hr_access
  end

  # Determine if someone has access to hr settings
  def hr_access?
    superuser? || hr_access
  end

  def manager_access?
    superuser? || manager_access
  end

  ########################################
  # HR Access by Organization
  ########################################
  def srmc_hr_access?
    hr_access? && employed_by_srmc?
  end

  def uh_hr_access?
    hr_access? && employed_by_unmh?
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
