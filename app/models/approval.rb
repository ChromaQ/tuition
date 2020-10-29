# == Schema Information
#
# Table name: approvals
#
#  id          :integer          not null, primary key
#  deny_reason :text
#  response    :string
#  role        :string
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
end
