class ChangeRoleToBeIntInApprovals < ActiveRecord::Migration[5.2]
  def change
    change_column :approvals, :role, :integer
  end
end
