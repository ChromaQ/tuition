class RemoveEmployeeIdFromCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :approvals,  :user_id, :integer
  end
end
