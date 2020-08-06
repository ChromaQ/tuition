class CreateImpressions < ActiveRecord::Migration[5.2]
  def change
    create_table :impressions do |t|
      t.references :user, foreign_key: true
      t.integer :target_id

      t.timestamps
    end
  end
end
