# == Schema Information
#
# Table name: credentials
#
#  id           :bigint           not null, primary key
#  auto_approve :boolean
#  description  :varchar(200)
#  name         :varchar(50)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  degree_id    :bigint
#
# Indexes
#
#  index_credentials_on_degree_id  (degree_id)
#
# Foreign Keys
#
#  fk_rails_...  (degree_id => degrees.id)
#
FactoryBot.define do
  factory :credential do
    name { Faker::Name.initials }
    description { Faker::Educator.subject }
    auto_approve { true }
    association :degree
  end
end
