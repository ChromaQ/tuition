# == Schema Information
#
# Table name: approvals
#
#  id          :integer          not null, primary key
#  deny_reason :text
#  response    :string
#  role        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#  employee_id :string
#
# Indexes
#
#  index_approvals_on_course_id  (course_id)
#
FactoryBot.define do
  factory :approval do
    course_id { 1 }
    employee_id { "MyString" }
    role { "MyString" }
    response { "MyString" }
    deny_reason { "MyText" }
    course { nil }
  end
end
