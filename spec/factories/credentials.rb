# == Schema Information
#
# Table name: credentials
#
#  id           :bigint           not null, primary key
#  auto_approve :boolean
#  description  :string(4000)
#  name         :string(4000)
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
    credential { "MyString" }
    description { "MyString" }
    auto_approve { false }
    degree { nil }
  end
end
