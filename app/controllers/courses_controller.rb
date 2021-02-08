class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.order(updated_at: :desc).includes(:user).references(:user)
    # need to link to the user, also provide something like a count of open course requests.
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new(employee_id: current_user.employee_id)
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Tuition reimbursement request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Tuition reimbursement request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Tuition reimbursement request was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.includes(:user, :approvals, :proofs).references(:approvals, :user, :proofs).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.require(:course).permit(:employee_id, :start_date, :end_date, :course_title, :course_short, :credit_hours, :cost)
  end
end
