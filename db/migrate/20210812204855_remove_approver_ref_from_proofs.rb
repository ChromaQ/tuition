class RemoveApproverRefFromProofs < ActiveRecord::Migration[6.0]
  def change
    remove_index :proofs, name: :index_proofs_on_approver_id
    remove_column :proofs, :approver_id, foreign_key: true
    remove_column :proofs, :response, :integer
    remove_column :proofs, :deny_reason, :string
    add_column :proofs, :status, :integer, null: false
  end
end
