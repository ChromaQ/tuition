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
  belongs_to :course
  belongs_to :user
end
