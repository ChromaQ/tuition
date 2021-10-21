# == Schema Information
#
# Table name: proofs
#
#  id         :bigint           not null, primary key
#  grade      :boolean
#  receipt    :boolean
#  status     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#
# Indexes
#
#  index_proofs_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
FactoryBot.define do
  factory :proof do
    receipt { false }
    grade { false }
    course { nil }
  end
end
