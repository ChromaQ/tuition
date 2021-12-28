# == Schema Information
#
# Table name: courses
#
#  id                     :bigint           not null, primary key
#  cost_estimate_cents    :integer          default(0), not null
#  cost_estimate_currency :varchar(50)      default("USD")
#  course_short           :varchar(50)
#  course_title           :varchar(200)
#  credit_hours           :integer
#  end_date               :datetime
#  start_date             :datetime
#  status                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employee_id            :varchar(50)
#  goal_id                :bigint
#  user_id                :bigint
#
# Indexes
#
#  index_courses_on_goal_id  (goal_id)
#  index_courses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (goal_id => goals.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validation tests' do
    context 'should have a user_id' do
      it { is_expected.to validate_presence_of(:user_id) }
    end

    context 'should have an employee_id' do
      it { is_expected.to validate_presence_of(:employee_id) }
    end

    context 'should have a goal_id' do
      it { is_expected.to validate_presence_of(:goal_id) }
    end
  end
  #
  # describe 'scope tests' do
  #   context 'find by employee'
  #
  # end
end
