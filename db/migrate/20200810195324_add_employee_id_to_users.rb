class AddEmployeeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :employee_id, :string
  end
end
