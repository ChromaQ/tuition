# == Schema Information
#
# Table name: schools
#
#  id         :bigint           not null, primary key
#  aka        :string(4000)
#  city       :string(4000)
#  name       :string(4000)     not null
#  opeid      :string(4000)
#  operating  :boolean          default(TRUE)
#  state      :string(30)
#  unitid     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :school do
    unitid { 1 }
    opeid { "MyString" }
    name { "MyString" }
    city { "MyString" }
    state { "MyString" }
    operating { false }
    aka { "MyString" }
  end
end
