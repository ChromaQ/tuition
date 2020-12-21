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
#
FactoryBot.define do
  factory(:employee) do
    ldapid { Faker::Internet.username }
    full_name { Faker::Name.name }
    employee_id { '1000' }
  end
end
