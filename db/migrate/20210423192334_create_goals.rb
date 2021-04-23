class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :focus
      t.boolean :active, default: true
      t.references :user, foreign_key: true
      t.references :school, foreign_key: true
      t.references :credential, foreign_key: true

      t.timestamps
    end
  end
end
