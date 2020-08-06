# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null
#  current_sign_in_at :datetime
#  current_sign_in_ip :string
#  displayname        :string
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :string
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
FactoryBot.define do
  factory :perm_user do
    
  end
end
