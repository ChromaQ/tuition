# == Schema Information
#
# Table name: courses
#
#  id           :bigint           not null, primary key
#  cost         :float
#  course_short :string(4000)
#  course_title :string(4000)
#  credit_hours :integer
#  end_date     :datetime
#  start_date   :datetime
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :string(4000)
#  goal_id      :bigint
#  user_id      :bigint
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
    employee_id { "1000" }
    start_date { "2020-09-04 11:53:24" }
    end_date { "2020-09-04 11:53:24" }
    course_title { "MyString" }
    course_short { "MyString" }
    credit_hours { 1 }
    cost { 1.5 }
  end
end
