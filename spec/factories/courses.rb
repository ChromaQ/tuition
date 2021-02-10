# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  cost         :float
#  course_short :string
#  course_title :string
#  credit_hours :integer
#  end_date     :datetime
#  start_date   :datetime
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :string
#
FactoryBot.define do
  factory :course do
    employee_id { "1000" }
    start_date { "2020-09-04 11:53:24" }
    end_date { "2020-09-04 11:53:24" }
    course_title { "MyString" }
    course_short { "MyString" }
    credit_hours { 1 }
    cost { 1.5 }
  end
end
