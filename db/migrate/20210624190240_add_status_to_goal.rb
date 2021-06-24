class AddStatusToGoal < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :status, :integer, null: false, default: 0
  end
end
