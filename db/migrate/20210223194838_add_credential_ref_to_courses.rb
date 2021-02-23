class AddCredentialRefToCourses < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :credential, foreign_key: true
  end
end
