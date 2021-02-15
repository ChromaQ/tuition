# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null
#  company            :string
#  current_sign_in_at :datetime
#  current_sign_in_ip :string
#  displayname        :string
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
require 'rails_helper'

RSpec.describe PermUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
