class RemoveCostFromCourse < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :cost, :float
  end
end
