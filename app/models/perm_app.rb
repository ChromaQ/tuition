# frozen_string_literal: true

class PermApp < ApplicationRecord
  # The connection is commented out, because if you decide to not use perms and uncomment out the connection info
  # => when you run a migration or any sort of database interaction rails will fail. Because by default it tries to load all database connections
  # establish_connection :perms
  self.table_name = :apps
  self.sequence_name = :next_app_id

  has_many :perm_users, primary_key: :id, foreign_key: 'userid'
end
