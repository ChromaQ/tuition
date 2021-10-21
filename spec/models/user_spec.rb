# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  company            :varchar(50)
#  current_sign_in_at :datetime
#  current_sign_in_ip :varchar(100)
#  displayname        :varchar(200)
#  email              :varchar(200)
#  hr_access          :boolean
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :varchar(100)
#  manager_access     :boolean
#  sign_in_count      :integer          default(0), not null
#  superuser          :boolean          default(FALSE)
#  username           :varchar(100)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  employee_id        :varchar(50)
#
# Indexes
#
#  index_users_on_username  (username)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'username' do
      # RSpec Validators
      it { is_expected.to validate_presence_of(:username) }
      it { is_expected.to validate_length_of(:username).is_at_least(2) }

      # should-matchers validators
      it { should validate_presence_of(:username) }
      it { should validate_length_of(:username).is_at_least(2) }
    end

    context 'has a displayname' do
      it { should validate_presence_of(:displayname) }
    end

    context 'superuser' do
      it { should allow_value(true, false).for(:superuser) }
    end
  end

  describe 'with cas_extra_attributes' do
    let(:user) { FactoryBot.create(:user) }

    context 'when user attributes change they get updated' do
      it 'if new displayname is passed' do
        expect do
          user.cas_extra_attributes = ({ 'displayname': Faker::Name.name })
        end.to(change(user, :displayname))
      end
    end

    # this should only happen if the user joins /devgoup
    context 'when becoming a superuser' do
      it 'if user joins devgroup' do
        expect do
          user.cas_extra_attributes = ({ 'memberof': 'CN=devgroup,OU=UNMH_IT_Admin,OU=Group,OU=UNMH,DC=health,DC=unm,DC=edu' })
        end.to change(user, :superuser)
      end
    end
  end
end
