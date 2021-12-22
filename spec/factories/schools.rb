# == Schema Information
#
# Table name: schools
#
#  id         :bigint           not null, primary key
#  aka        :varchar(500)
#  city       :varchar(200)
#  name       :varchar(200)
#  opeid      :varchar(50)
#  operating  :boolean          default(TRUE)
#  state      :string(30)
#  unitid     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :school do
    unitid { Faker::Number.unique.number(digits: 5) }
    opeid { Faker::Number.unique.number(digits: 5) }
    name { Faker::Educator.university }
    city { Faker::Address.city }
    state { Faker::Address.state }
    operating { true }
    aka { Faker::Name.initials }
  end
end
