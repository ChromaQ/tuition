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
require 'rails_helper'

RSpec.describe Approval, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
