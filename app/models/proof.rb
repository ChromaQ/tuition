# frozen_string_literal: true

# == Schema Information
#
# Table name: proofs
#
#  id          :bigint           not null, primary key
#  deny_reason :string(4000)
#  grade       :boolean
#  receipt     :boolean
#  response    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  approver_id :bigint
#  course_id   :bigint
#
# Indexes
#
#  index_proofs_on_approver_id  (approver_id)
#  index_proofs_on_course_id    (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (approver_id => users.id)
#  fk_rails_...  (course_id => courses.id)
#
class Proof < ApplicationRecord
  belongs_to :course
  belongs_to :approver, class_name: 'User', optional: true
  has_many :approvals
  has_one_attached :document, dependent: :delete
  validates :course_id, presence: true
  validates :document, presence: true

  enum response: { pending: 0, denied: 1, approved: 2 }

  # Display what kind of proof documentation is being submitted - if a word doc is submitted, it could have multiple images for both types of proof, for example.
  def proof_type
    if receipt? && grade?
      'Account Statement & Grade'
    elsif receipt?
      'Account Statement'
    elsif grade?
      'Grade'
    else
      'Unknown'
    end
  end

end
