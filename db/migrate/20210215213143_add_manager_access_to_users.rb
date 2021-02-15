class AddManagerAccessToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :manager_access, :boolean
    add_column :users, :hr_access, :boolean
  end
end
