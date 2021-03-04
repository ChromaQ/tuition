# frozen_string_literal: true

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
#  approver_id :integer         fk user.id
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
class Proof < ApplicationRecord
  belongs_to :course
  belongs_to :approver, class_name: 'User', optional: true
  has_one_attached :document, dependent: :delete
  validates :course_id, presence: true

  enum response: { denied: 0, approved: 1 }
end
