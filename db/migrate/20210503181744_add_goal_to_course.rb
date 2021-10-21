class AddGoalToCourse < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :goal, foreign_key: true
    remove_reference :courses, :credential, index: true
    # remove_index :courses, :credential_id
    # remove_column :courses, :credential_id
  end
end
