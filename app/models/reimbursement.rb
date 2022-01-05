# frozen_string_literal: true

# == Schema Information
#
# Table name: reimbursements
#
#  id               :bigint           not null, primary key
#  amount_cents     :integer          default(0), not null
#  amount_currency  :string(4000)     default("USD"), not null
#  created_by       :varchar(50)      not null
#  credits_approved :integer
#  fiscal_year      :datetime         not null
#  grade_met        :boolean          default(TRUE)
#  payee            :varchar(50)      not null
#  reviewed_by      :varchar(50)
#  status           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  course_id        :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_reimbursements_on_course_id  (course_id)
#  index_reimbursements_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (user_id => users.id)
#
class Reimbursement < ApplicationRecord

  # == Relationships ==================================
  belongs_to :course
  belongs_to :user
  # belongs_to :creator, class_name: 'User', primary_key: :created_by, foreign_key: :employee_id

  enum status: { draft: 0, pending: 1, denied: 2, approved: 3, reviewed: 4, withdrawn: 5, reimbursed: 6 }

  monetize :amount_cents, allow_nil: true

  # == Validations ====================================
  validates :payee, presence: true
  validates :course_id, presence: true

  # == Scopes =========================================
  scope :review_amount, -> { includes(:course).where("amount_cents >= 200000") } # business requirement - reimbursements over $2k need to be reviewed by benefits mgr

  # == InstanceMethods ================================

  def creator
    User.find_by(employee_id: created_by)
  end

  def reviewer
    User.find_by(employee_id: reviewed_by)
  end

  # == ClassMethods ===================================

  # estimate fiscal year of reimbursement
  def self.estimate_fiscal_year
    now = DateTime.now
    if now.month >= 7
      DateTime.now + 1.year
    else
      now
    end
  end

  def self.last_year
    DateTime.now - 1.year
  end

  def self.this_year
    DateTime.now
  end

  def self.next_year
    DateTime.now + 1.year
  end


  def who_dat(employee_id)
    User.find_by(employee_id: employee_id)
  rescue
    Employee.where(employee_id: employee_id).first_name
  end

end
