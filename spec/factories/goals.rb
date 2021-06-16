# == Schema Information
#
# Table name: goals
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(TRUE)
#  focus         :string(4000)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  credential_id :bigint
#  school_id     :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_goals_on_credential_id  (credential_id)
#  index_goals_on_school_id      (school_id)
#  index_goals_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (credential_id => credentials.id)
#  fk_rails_...  (school_id => schools.id)
#  fk_rails_...  (user_id => users.id)
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
