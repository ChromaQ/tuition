# == Schema Information
#
# Table name: goals
#
#  id            :integer          not null, primary key
#  active        :boolean          default(TRUE)
#  focus         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  credential_id :integer
#  school_id     :integer
#  user_id       :integer
#
# Indexes
#
#  index_goals_on_credential_id  (credential_id)
#  index_goals_on_school_id      (school_id)
#  index_goals_on_user_id        (user_id)
#
# Foreign Keys
#
#  credential_id  (credential_id => credentials.id)
#  school_id      (school_id => schools.id)
#  user_id        (user_id => users.id)
#
FactoryBot.define do
  factory :goal do
    focus { "MyString" }
    active { false }
    user { nil }
    school { nil }
    credential { nil }
  end
end
