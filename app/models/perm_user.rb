# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null
#  company            :string
#  current_sign_in_at :datetime
#  current_sign_in_ip :string
#  displayname        :string
#  email              :string
#  hr_access          :boolean
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :string
#  manager_access     :boolean
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :string
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
class PermUser < ApplicationRecord
  # The connection is commented out, because if you decide to not use perms and uncomment out the connection info
  # => when you run a migration or any sort of database interaction rails will fail. Because by default it tries to load all database connections
  # establish_connection :perms
  self.table_name = :users
  self.primary_key = :userid
  # == Attributes =====================================

  # == Constants ======================================

  # == Extensions =====================================

  # == Relationships ==================================
  belongs_to :app_perm, primary_key: :userid, foreign_key: :userid

  # == Validations ====================================

  # == Scopes =========================================

  # == Callbacks ======================================
  # This is required, because the CF apps never set a database sequence for the application perms
  before_create :get_id

  # == ClassMethods ===================================

  # == InstanceMethods ================================
  def get_id
    sql = "select max(userid)+1 x from users"
    id = User.find_by_sql(sql)
    self.userid = id[0].x
 end
end
