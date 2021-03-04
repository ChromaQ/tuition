# == Schema Information
#
# Table name: credentials
#
#  id           :integer          not null, primary key
#  auto_approve :boolean
#  description  :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  degree_id    :integer
#
# Indexes
#
#  index_credentials_on_degree_id  (degree_id)
#
FactoryBot.define do
  factory :credential do
    credential { "MyString" }
    description { "MyString" }
    auto_approve { false }
    degree { nil }
  end
end
