# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  cost          :float
#  course_short  :string
#  course_title  :string
#  credit_hours  :integer
#  end_date      :datetime
#  start_date    :datetime
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  credential_id :integer
#  employee_id   :string
#  user_id       :integer
#
# Indexes
#
#  index_courses_on_credential_id  (credential_id)
#  index_courses_on_user_id        (user_id)
#
class Course < ApplicationRecord


  # == Relationships ==================================
  belongs_to :user
  belongs_to :credential
  has_many   :approvals
  has_many   :proofs

  enum status: { draft: 0, pending: 1, denied: 2, approved: 3, withdrawn: 4, reimbursed: 5 }
  # == Validations ====================================
  validates :employee_id, presence: true

  # == Scopes =========================================
  scope :submitted_by_employee, ->(employee_id) { where(employee_id: employee_id) }
  scope :subordinate_requests, lambda { |employee_id|
    includes(:employee)
        .where(employee_id: Employee.managed_by(employee_id).not_termed
                                .pluck(:employee_id))
        .order(updated_at: :desc)
  }


end
