class AddApproverRefToProofs < ActiveRecord::Migration[6.0]
  def change
    add_reference :proofs, :approver, foreign_key: { to_table: :users }, null: true
    add_column :proofs, :response, :integer
    add_column :proofs, :deny_reason, :string
  end
end
