# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id                     :bigint           not null, primary key
#  cost_estimate_cents    :integer          default(0), not null
#  cost_estimate_currency :varchar(50)      default("USD")
#  course_short           :varchar(50)
#  course_title           :varchar(200)
#  credit_hours           :integer
#  end_date               :datetime
#  start_date             :datetime
#  status                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employee_id            :varchar(50)
#  goal_id                :bigint
#  user_id                :bigint
#
# Indexes
#
#  index_courses_on_goal_id  (goal_id)
#  index_courses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (goal_id => goals.id)
#  fk_rails_...  (user_id => users.id)
#
class Course < ApplicationRecord
  # == Relationships ==================================
  belongs_to :goal
  belongs_to :user
  has_many   :approvals, dependent: :destroy
  has_many   :proofs,    dependent: :destroy
  has_one :reimbursement

  enum status: { draft: 0, pending: 1, denied: 2, approved: 3, withdrawn: 4, reimbursed: 5 }

  # see https://github.com/RubyMoney/money-rails for info on using monetize & associated helpers
  monetize :cost_estimate_cents, allow_nil: true

  # == Validations ====================================
  validates :employee_id, presence: true
  validates :goal_id, presence: true
  validates :user_id, presence: true
  validates :start_date, :end_date, presence: true

  # == Scopes =========================================
  scope :proof_review, -> { includes(:proofs).where(status: 'pending').references(:proofs) }
  scope :submitted_by_employee, ->(employee_id) { where(employee_id: employee_id) }
  scope :subordinate_requests, lambda { |employee_id|
    includes(:employee)
      .where(employee_id: Employee.managed_by(employee_id).not_termed
                                .pluck(:employee_id))
      .order(updated_at: :desc)
  }

  # == InstanceMethods ===================================
  # once manager approves course, update course status to approved after creating an approval record
  def approve_course(approved_by)
    approval = Approval.new(course_id: self.id, user_id: approved_by.id, employee_id: approved_by.employee_id, response: 'approved', role: 'manager')
    if approval.save
      self.approved!
      true
    else
      false
    end
  end

  # estimate fiscal year of course - currently based on course end_date value
  def fiscalyear_estimate
    time = self.end_date
    if time.month >= 7
      time.year + 1
    else
      time.year
    end
  end

  # check to see if the course is ready for a proof review by the benefits team
  def proof_reviewable
    proofs = Proof.where(course_id: id)
    proofs.any?(&:grade_reviewable) && proofs.any?(&:receipt_reviewable)
  end

  # check to see whether the course is ready for a reimbursement
  def reimbursable
    proofs = Proof.where(course_id: id)
    proofs.any?(&:grade_approved) && proofs.any?(&:receipt_approved)
  end

  # == ClassMethods ===================================

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, 'Must be after the start date.')
    end
  end

end
