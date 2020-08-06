# == Schema Information
#
# Table name: impressions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  target_id  :integer
#  user_id    :integer
#
# Indexes
#
#  index_impressions_on_user_id  (user_id)
#
FactoryBot.define do
  factory :impression do
    user { nil }
    target_id { 1 }
  end
end
