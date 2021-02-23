class CreateCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :credentials do |t|
      t.string :credential
      t.string :description
      t.boolean :auto_approve
      t.references :degree, foreign_key: true

      t.timestamps
    end
  end
end
