# frozen_string_literal: true

# == Schema Information
#
# Table name: emp_all
#
#  addr1               :string(50)
#  addr2               :string(50)
#  addr3               :string(50)
#  adjusted_hire_date  :date             not null
#  annivers_date       :date             not null
#  bargain_unit        :string(10)
#  benefit_class       :string(4000)
#  benefit_date        :date             not null
#  benefit_status      :string(4000)
#  birth_date          :date             not null
#  citizenship         :string(10)
#  city                :string(50)
#  company             :integer          not null
#  country             :string(2)
#  department          :string(5)        not null
#  dept_name           :string(30)
#  dept_num            :string(50)
#  eeoc_code           :string(4)
#  email               :string(150)
#  employee_status     :string(4000)
#  ethnic_code         :string(4)
#  first_name          :string(15)
#  former_name         :string(49)
#  fte_point           :decimal(, )
#  fte_status          :decimal(, )
#  fte_status_code     :decimal(, )
#  full_name           :string(47)
#  grade               :string(4000)
#  hire_date           :date             not null
#  home_area_code      :string(3)
#  home_phone          :string(8)
#  ins_expiration_2    :date             not null
#  ins_expiration_date :date             not null
#  ins_id_2            :string(20)
#  ins_type            :string(10)
#  ins_type_2          :string(10)
#  kronos_badge_number :string(10)       not null
#  last_name           :string(30)
#  law_pref_phone      :string(30)
#  ldapid              :string(100)
#  middle_initial      :string(1)
#  office_area_code    :string(3)
#  office_phone        :string(8)
#  pay_rate            :decimal(13, 4)   not null
#  payroll_group       :string(10)
#  phone               :string(100)
#  position_code       :string(9)
#  prob_date           :date
#  process_level       :string(5)
#  sex                 :string(1)
#  smoker              :string(1)
#  ssn                 :string(9)
#  standard_hours      :decimal(, )
#  state               :string(2)
#  term_date           :date             not null
#  title               :string(30)
#  union_code          :string(10)
#  userid              :integer
#  zip                 :string(10)
#  banner_id           :string(25)
#  employee_id         :integer          not null, primary key
#  ins_id              :string(20)
#  manager_id          :decimal(, )
#
class Employee < ApplicationRecord
  establish_connection :hrpayroll
  self.table_name = :emp_all
  self.primary_key = :employee_id

  # == Attributes =====================================
  attribute :dept_num, :string
  attribute :employee_id, :integer
  attribute :manager_id, :integer
  attribute :fte_status, :float # this is because it's a number Oracle/Rails like to assign it as a shorthand number 1e-3
  attribute :standard_hours, :float
  alias_attribute :id, :employee_id
  alias_attribute :department, :dept_num
  alias_attribute :firstname, :first_name
  alias_attribute :lastname, :last_name
  alias_attribute :fullname, :full_name
  alias_attribute :fte, :fte_status
  alias_attribute :position, :position_code
  alias_attribute :status, :employee_status
  alias_attribute :hire_date, :adjusted_hire_date

  # == Constants =====================================
  # Employee Status in the database: AC, [Null], LV, and TR
  # => AC -> Active, LV -> On Leave, TR -> Termed
  enum employee_status: { active: 'AC', leave: 'LV', termed: 'TR' }

  enum company: { 'UNMH' => '10', 'SRMC' => '400', 'UNMMG' => '500' }

  # == Extensions ====================================

  # == Relationships =================================
  belongs_to :user, primary_key: :employee_id, foreign_key: :employee_id
  belongs_to :manager, class_name: 'Employee', foreign_key: :manager_id
  delegate :status, to: :user, prefix: true

  # == Validations ===================================

  # == Scopes ========================================
  # Available statuses: TR, Null, AC, LV (AC = Active, LV =  Leave, TR = Termed)
  scope :is_active, -> { where(status: %i[active leave]) }
  scope :is_termed, -> { where(status: :termed) }
  scope :is_not_termed, -> { where.not(status: :termed) }

  # Employed by specific Organization
  scope :srmc_employee, -> { where(company: 'SRMC') }
  scope :uh_employee, -> { where(company: 'UNMH') } # 10 = UNMH
  scope :unmmg_employee, -> { where(company: 'UNMMG') }

  # Must have at least .5 FTE status to be eligible for tuition reimbursement program
  # scope :fte_eligible, -> { where(fte_status: >= 0.5)}
  # scope :eligible, -> { where(eligible_at <= Date.today - 6.months, status: :is_active, company: 'UNMH')}

  # ==> Additional conditional scopes (most of the ones below are chained across several scopes)
  # scope :not_termed, -> { where(term_date: term_date) }
  scope :fetch_department, ->(employee_id) { where(employee_id: employee_id).pluck(:department).to_a }

  # Position control scope
  scope :in_department, lambda { |dept_num|
    select(:id, :fullname, :position, :hire_date, :grade, :fte, :title)
        .where(dept_num: dept_num).is_active
        .sort_by_position
  }

  # Return a scope to get employees for the specified company
  #
  # @param company [String] the company in which you want to limit the the stats search to
  # @return [Scope] return a scope limiting the query to SRMC or UNMH employees
  def self.limit_to_org(company = '')
    case company
    when 'SRMC'
      srmc_employee
    else
      uh_employee
    end
  end

  # How many credits per fiscal year is an employee eligible for, based on an employee's FTE status in HR Payroll
  def max_credits_per_year
    return 0 if fte_status.blank? # If you don't have an FTE status in HR Payroll, you don't get any credit allotment.

    case fte_status.to_f
    when (0.9...) # between 0.9 and 1.0 FTE, eligible for 24 credits per fiscal year
      24
    when (0.7..0.9) # between 0.7 and under 0.9 FTE, eligible for 21 credits per fiscal year
      21
    when (0.5..0.7) # between 0.5 and under 0.7 FTE, eligible for 18 credits per fiscal year
      18
    else
      0 # under 0.5 FTE, ineligible for tuition reimbursement program
    end
  end

  # Is someone eligible for the tuition reimbursement program?
  def eligible_for_reimbursement?
    @eligible_for_reimbursement ||= (max_credits_per_year.positive? ? true : false)
  end

  scope :sort_by_position, -> { order([:position_code, Employee[:full_name].lower.asc]) }
  # VTF Search
  scope :search_by, lambda { |str|
    select(:firstname, :lastname, :ldapid, :id)
        .where(Employee[:ldapid].lower.matches("#{str}%").or(Employee[:full_name].lower.matches("%#{str}%")))
        .not_termed
        .order(Employee[:first_name].lower.asc, Employee[:last_name].lower.asc)
        .limit(10)
  }
  scope :search_by_ldapid, ->(ldapid) { where(Employee[:ldapid].lower.eq(ldapid.downcase)) }

  scope :fmla_search, lambda { |str|
    select(:ldapid, :full_name)
        .where(Employee[:ldapid].lower.matches("%#{str}%").or(Employee[:full_name].lower.matches("%#{str}%")))
        .where.not(ldapid: nil)
        .not_termed.uh_employee
        .order(Employee[:first_name].lower.asc, Employee[:last_name].lower.asc)
        .limit(20)
        .pluck(:ldapid, :full_name)
  }
  scope :eligibility_lookup, lambda { |ldapid|
    select(:employee_id, :hire_date, :manager_id)
        .not_termed.uh_employee
        .find_by(ldapid: ldapid)
  }

  # select all employees who are managed by the specified employee
  scope :managed_by, ->(employee_id) { where(manager_id: employee_id) }

  # Used a rescue, because not everyone has a manager/manager_id in the DB
  scope :get_manager, lambda { |employee_id|
    begin
      find_by(employee_id: Employee.select(:manager_id).find_by(employee_id: employee_id).manager_id)
    rescue => e
      Rails.logger.warn e
      {}
    end
  }

  scope :get_name_by_id, ->(employee_id) { select(:full_name).find_by(employee_id: employee_id) }


  # == Callbacks =====================================
  def self.sort_stats(employees)
    employees.sort_by { |x| (x[0].nil? ? 'not given' : x[0].downcase) }
  end

  # == Class Methods =================================
  # this is the date that's set if someone hasn't been termed
  def self.term_date
    DateTime.parse('01/01/1700 12:00:00 am')
  end

  # == Instance Methods ==============================
  def search_display_name
    "#{firstname} #{lastname}"
  end

  def eligible_at
    hire_date + 6.months
  end
end
