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
#  user_id      :integer
#
# Indexes
#
#  index_courses_on_user_id  (user_id)
#
class Course < ApplicationRecord


  # == Relationships ==================================
  belongs_to  :user, primary_key: :employee_id, foreign_key: :employee_id
  has_many    :approvals
  has_many    :proofs

  enum status: { draft: 0, denied: 1, approved: 2, withdrawn: 3 }
  # == Validations ====================================
  validates :employee_id, presence: true

  # == Scopes =========================================
  scope :submitted_by_employee, ->(employee_id) { where(employee_id: employee_id) }
  scope :subordinate_requests, lambda { |employee_id|
    includes(:employee)
        .where(employee_id: Employee.managed_by(employee_id).not_termed
                                .pluck(:employee_id))
        .order(emp_submit_date: :desc)
  }


end
