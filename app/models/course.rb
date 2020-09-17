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
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :string
#
class Course < ApplicationRecord


  # == Relationships ==================================
  belongs_to  :employee
  has_many    :approvals
  # == Validations ====================================


end
