FactoryBot.define do
  factory(:user) do
    username { Faker::Internet.username }
    superuser { false }
    displayname { Faker::Name.name }
  end
end
