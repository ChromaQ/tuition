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
