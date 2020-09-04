json.extract! course, :id, :employee_id, :start_date, :end_date, :course_title, :course_short, :credit_hours, :cost, :created_at, :updated_at
json.url course_url(course, format: :json)
