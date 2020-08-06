# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # If you need, you can add the basic devise fields in order to use all over functions
      t.string :username, null: false
      t.string :displayname
      t.boolean :superuser, default: false
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.timestamps null: false
    end
    add_index :users, :username, unique: true
  end
end
