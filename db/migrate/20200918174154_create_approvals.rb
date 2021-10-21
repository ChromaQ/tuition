class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      # t.integer :course_id
      t.string :employee_id
      t.string :role
      t.string :response
      t.text :deny_reason
      t.references :course, foreign_key: true, null: true

      t.timestamps
    end
  end
end
