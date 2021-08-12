# frozen_string_literal: true

# == Schema Information
#
# Table name: proofs
#
#  id         :bigint           not null, primary key
#  grade      :boolean
#  receipt    :boolean
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#
# Indexes
#
#  index_proofs_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
class Proof < ApplicationRecord
  belongs_to :course
  has_many :approvals, dependent: :destroy
  has_one_attached :document, dependent: :delete
  validates :course_id, presence: true
  validates :document, presence: true

  enum status: { draft: 0, pending: 1, denied: 2, approved: 3, withdrawn: 4 }

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
