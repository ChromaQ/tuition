# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  cost          :float
#  course_short  :string
#  course_title  :string
#  credit_hours  :integer
#  end_date      :datetime
#  start_date    :datetime
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  credential_id :integer
#  employee_id   :string
#  user_id       :integer
#
# Indexes
#
#  index_courses_on_credential_id  (credential_id)
#  index_courses_on_user_id        (user_id)
#
# Foreign Keys
#
#  credential_id  (credential_id => credentials.id)
#  user_id        (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
