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
#  goal_id     :bigint
#  proof_id    :bigint
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
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (goal_id => goals.id)
#  fk_rails_...  (proof_id => proofs.id)
#
FactoryBot.define do
  factory :approval do
    course_id { 1 }
    employee_id { "MyString" }
    role { "MyString" }
    response { 1 }
    deny_reason { "MyText" }
    goal_id { nil }
    proof_id { nil }
    user_id { 1 }
  end
end
