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
require 'rails_helper'

RSpec.describe PermUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
