# frozen_string_literal: true

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
class Approval < ApplicationRecord
  # == Relationships ==================================
  belongs_to :course, optional: true
  belongs_to :goal, optional: true
  belongs_to :proof, optional: true
  belongs_to :user, primary_key: :employee_id, foreign_key: :employee_id

  enum role:     { applicant: 0, manager: 1, human_resources: 2, auto_approval: 3 }
  enum response: { denied: 0, approved: 1 }



  def manager_approved?
    approved? && manager?
  end

  def manager_denied?
    denied? && manager?
  end

  def hr_approved?
    approved? && human_resources?
  end

  def hr_denied?
    denied? && human_resources?
  end

  def auto_approved?
    approved? && auto_approval?
  end
end
