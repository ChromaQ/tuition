class CreateReimbursements < ActiveRecord::Migration[6.0]
  def change
    create_table :reimbursements do |t|
      t.references :course, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.boolean :grade_met, default: true
      t.integer :credits_approved
      t.monetize :amount
      t.datetime :fiscal_year, null: false
      t.integer :status
      if ActiveRecord::Base.connection.instance_values["config"][:adapter] == "sqlserver"
        t.varchar :payee, class: User, foreign_key: :employee_id, limit: 50, null: false
        t.varchar :created_by, class: User, foreign_key: :employee_id, limit: 50, null: false
        t.varchar :reviewed_by, class: User, foreign_key: :employee_id, limit: 50
      else
        t.string :payee, class: User, foreign_key: :employee_id, null: false
        t.string :created_by, class: User, foreign_key: :employee_id, null: false
        t.string :reviewed_by, class: User, foreign_key: :employee_id
      end

      t.timestamps
    end
  end
end
