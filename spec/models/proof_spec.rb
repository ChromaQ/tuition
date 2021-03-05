# == Schema Information
#
# Table name: proofs
#
#  id          :integer          not null, primary key
#  deny_reason :string
#  grade       :boolean
#  receipt     :boolean
#  response    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  approver_id :integer
#  course_id   :integer
#
# Indexes
#
#  index_proofs_on_approver_id  (approver_id)
#  index_proofs_on_course_id    (course_id)
#
# Foreign Keys
#
#  approver_id  (approver_id => users.id)
#  course_id    (course_id => courses.id)
#
require 'rails_helper'

RSpec.describe Proof, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
