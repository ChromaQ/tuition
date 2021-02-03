# == Schema Information
#
# Table name: approvals
#
#  id          :integer          not null, primary key
#  deny_reason :text
#  response    :integer
#  role        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#  employee_id :string
#
# Indexes
#
#  index_approvals_on_course_id  (course_id)
#
class Approval < ApplicationRecord
  belongs_to :course
  enum role:     { applicant: 0, manager: 1, human_resources: 2, system: 3 }
  enum response: { denied: 0, approved: 1}
end
