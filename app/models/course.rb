# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  cost         :float
#  course_short :string
#  course_title :string
#  credit_hours :integer
#  end_date     :datetime
#  start_date   :datetime
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :string
#  goal_id      :integer
#  user_id      :integer
#
# Indexes
#
#  index_courses_on_goal_id  (goal_id)
#  index_courses_on_user_id  (user_id)
#
# Foreign Keys
#
#  goal_id  (goal_id => goals.id)
#
class Course < ApplicationRecord
  # == Relationships ==================================
  belongs_to :goal
  has_many   :approvals, dependent: :destroy
  has_many   :proofs,    dependent: :destroy

  enum status: { draft: 0, pending: 1, denied: 2, approved: 3, withdrawn: 4, reimbursed: 5 }

  # == Validations ====================================
  validates :employee_id, presence: true
  validates :goal_id, presence: true

  # == Scopes =========================================
  scope :submitted_by_employee, ->(employee_id) { where(employee_id: employee_id) }
  scope :subordinate_requests, lambda { |employee_id|
    includes(:employee)
        .where(employee_id: Employee.managed_by(employee_id).not_termed
                                .pluck(:employee_id))
        .order(updated_at: :desc)
  }

  # once hr approves course, update course status to approved after creating an approval record
  def approve_course(approved_by)
    approval = Approval.new(course_id: self.id, user_id: approved_by.id, employee_id: approved_by.employee_id, response: 'approved', role: 'human_resources')
    if approval.save
      self.approved!
      true
    else
      false
    end
  end

end
