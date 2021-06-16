# == Schema Information
#
# Table name: approvals
#
#  id          :bigint           not null, primary key
#  deny_reason :text(2147483647)
#  response    :integer
#  role        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint
#  employee_id :string(4000)
#  user_id     :integer
#
# Indexes
#
#  index_approvals_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
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
