class RemoveResponseFromApprovals < ActiveRecord::Migration[5.2]
  def change
    remove_column :approvals, :response, :string
    add_column :approvals, :response, :integer
  end
end
