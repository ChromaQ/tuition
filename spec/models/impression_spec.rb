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
require 'rails_helper'

RSpec.describe Impression, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:target) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:target) }
  end
end
