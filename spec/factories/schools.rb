# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  aka        :string
#  city       :string
#  name       :string           not null
#  opeid      :string
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
