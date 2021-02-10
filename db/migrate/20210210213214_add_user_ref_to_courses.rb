class AddUserRefToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :user, foreign_key: true, index: true
  end
end
