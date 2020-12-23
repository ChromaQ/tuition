class CreateProofs < ActiveRecord::Migration[5.2]
  def change
    create_table :proofs do |t|
      t.boolean :receipt
      t.boolean :grade
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
