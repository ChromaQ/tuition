class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.integer :unitid, null: false
      t.string :opeid
      t.string :name, null: false
      t.string :city
      t.string :state, limit: 30
      t.boolean :operating, default: true
      t.string :aka

      t.timestamps
    end
  end
end
