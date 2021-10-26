json.extract! reimbursement, :id, :course_id, :user_id, :payee, :created_by, :reviewed_by, :grade_met, :credits_approved, :amount, :fiscal_year, :status, :created_at, :updated_at
json.url reimbursement_url(reimbursement, format: :json)
