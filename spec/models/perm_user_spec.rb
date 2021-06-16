# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null
#  company            :string(4000)
#  current_sign_in_at :datetime
#  current_sign_in_ip :string(4000)
#  displayname        :string(4000)
#  email              :string(4000)
#  hr_access          :boolean
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :string(4000)
#  manager_access     :boolean
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :string(4000)     not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :string(4000)
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
require 'rails_helper'

RSpec.describe PermUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
