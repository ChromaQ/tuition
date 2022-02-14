json.extract! proof, :id, :created_at, :updated_at, :status, :course_id, :grade, :receipt
json.url proof_url(proof, format: :json)
