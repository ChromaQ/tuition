# == Schema Information
#
# Table name: approvals
#
#  id          :integer          not null, primary key
#  deny_reason :text
#  response    :integer
#  role        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#  employee_id :string
#  goal_id     :integer
#  proof_id    :integer
#  user_id     :integer
#
# Indexes
#
#  index_approvals_on_course_id  (course_id)
#  index_approvals_on_goal_id    (goal_id)
#  index_approvals_on_proof_id   (proof_id)
#
# Foreign Keys
#
#  goal_id   (goal_id => goals.id)
#  proof_id  (proof_id => proofs.id)
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
