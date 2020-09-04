class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :employee_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :course_title
      t.string :course_short
      t.integer :credit_hours
      t.float :cost, scale: 2

      t.timestamps
    end
  end
end
