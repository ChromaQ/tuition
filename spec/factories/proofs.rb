# == Schema Information
#
# Table name: proofs
#
#  id          :integer          not null, primary key
#  deny_reason :string
#  grade       :boolean
#  receipt     :boolean
#  response    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  approver_id :integer
#  course_id   :integer
#
# Indexes
#
#  index_proofs_on_approver_id  (approver_id)
#  index_proofs_on_course_id    (course_id)
#
# Foreign Keys
#
#  approver_id  (approver_id => users.id)
#  course_id    (course_id => courses.id)
#
FactoryBot.define do
  factory :proof do
    receipt { false }
    grade { false }
    course { nil }
  end
end
