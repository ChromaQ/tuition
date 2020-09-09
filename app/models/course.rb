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

  # == Validations ====================================


  def course_params
    params.require(:course).permit(:employee_id, :start_date, :end_date, :course_title, :course_short, :credit_hours, :cost, :created_at, :updated_at)
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
