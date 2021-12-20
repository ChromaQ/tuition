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
FactoryBot.define do
  factory :course do
    employee_id { Faker::Number.unique.number(digits: 5) }
    user_id { 1 }
    goal_id { 1 }
    start_date { "2020-09-04 11:53:24" }
    end_date { "2020-09-04 11:53:24" }
    course_title { Faker::Company.bs }
    course_short { Faker::Alphanumeric(number: 6, min_alpha: 3, min_numeric: 3) }
    credit_hours { Faker::Number.number(digits: 1) }
    cost_estimate_cents { Faker::Number.number(digits: 6) }
  end
end
