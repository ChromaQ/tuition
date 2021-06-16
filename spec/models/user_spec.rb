# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  company            :string(4000)
#  current_sign_in_at :datetime
#  current_sign_in_ip :string(4000)
#  displayname        :string(4000)
#  email              :string(4000)
#  hr_access          :boolean
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :string(4000)
#  manager_access     :boolean
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :string(4000)     not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :string(4000)
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'username' do
      # RSpec Validaors
      # it { is_expected.to validate_presence_of(:username) }
      # it { is_expected.to validate_length_of(:username).is_at_least(2) }

      # should-matchers validators
      it { should validate_presence_of(:username) }
      it { should validate_length_of(:username).is_at_least(2) }
    end

    context 'displayname' do
      it { should validate_presence_of(:displayname) }
    end

    context 'superuser' do
      it { should allow_value(true, false).for(:superuser) }
    end
  end

  describe 'with cas_extra_attributes' do
    let(:user) { FactoryBot.create(:user) }
    context 'updates user attributes' do
      it 'if new displayname is passed' do
        expect do
          user.cas_extra_attributes=({ 'displayname': Faker::Name.name })
        end.to change { user.displayname }
      end
    end

    # this should only happen if the user joins /devgoup
    context 'update to superuser' do
      it 'if user joins devgroup' do
        expect do
          user.cas_extra_attributes=({ 'memberof': 'CN=devgroup,OU=UNMH_IT_Admin,OU=Group,OU=UNMH,DC=health,DC=unm,DC=edu' })
        end.to change { user.superuser }
      end
    end
  end
end
