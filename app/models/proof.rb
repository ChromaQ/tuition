# frozen_string_literal: true

# == Schema Information
#
# Table name: proofs
#
#  id         :integer          not null, primary key
#  grade      :boolean
#  receipt    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#
# Indexes
#
#  index_proofs_on_course_id  (course_id)
#
# Foreign Keys
#
#  course_id  (course_id => courses.id)
#
class Proof < ApplicationRecord
  belongs_to :course
  has_one_attached :document, dependent: :delete
end
