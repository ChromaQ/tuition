# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null
#  company            :varchar(50)
#  current_sign_in_at :datetime
#  current_sign_in_ip :varchar(100)
#  displayname        :varchar(200)
#  email              :varchar(200)
#  hr_access          :boolean
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :varchar(100)
#  manager_access     :boolean
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :varchar(100)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :varchar(50)
#
# Indexes
#
#  index_users_on_username  (username)
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
