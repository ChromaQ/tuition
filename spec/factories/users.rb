# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
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
FactoryBot.define do
  factory(:user) do
    username { Faker::Internet.username }
    superuser { Faker::Boolean.boolean }
    displayname { Faker::Name.name }
    employee_id { '1000' }
    hr_access { Faker::Boolean.boolean }
  end
end
