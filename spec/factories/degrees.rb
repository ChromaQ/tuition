# == Schema Information
#
# Table name: degrees
#
#  id         :bigint           not null, primary key
#  name       :varchar(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :degree do
    degree { "MyString" }
  end
end
