json.extract! user, :id, :username, :displayname, :email, :company, :superuser, :manager_access, :hr_access, :sign_in_count, :created_at, :updated_at, :manager_access, :hr_access
json.url course_url(user, format: :json)
