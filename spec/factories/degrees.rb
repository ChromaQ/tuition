# == Schema Information
#
# Table name: degrees
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :degree do
    degree { "MyString" }
  end
end
