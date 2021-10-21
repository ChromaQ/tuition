# == Schema Information
#
# Table name: courses
#
#  id                     :bigint           not null, primary key
#  cost_estimate_cents    :integer          default(0), not null
#  cost_estimate_currency :string(4000)     default("USD"), not null
#  course_short           :string(4000)
#  course_title           :string(4000)
#  credit_hours           :integer
#  end_date               :datetime
#  start_date             :datetime
#  status                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employee_id            :string(4000)
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
  pending "add some examples to (or delete) #{__FILE__}"
end
