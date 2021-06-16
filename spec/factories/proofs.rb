# == Schema Information
#
# Table name: proofs
#
#  id          :bigint           not null, primary key
#  deny_reason :string(4000)
#  grade       :boolean
#  receipt     :boolean
#  response    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  approver_id :bigint
#  course_id   :bigint
#
# Indexes
#
#  index_proofs_on_approver_id  (approver_id)
#  index_proofs_on_course_id    (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (approver_id => users.id)
#  fk_rails_...  (course_id => courses.id)
#
FactoryBot.define do
  factory :proof do
    receipt { false }
    grade { false }
    course { nil }
  end
end
