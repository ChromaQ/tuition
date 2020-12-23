# == Schema Information
#
# Table name: proofs
#
#  id         :integer          not null, primary key
#  grade      :boolean
#  receipt    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#
# Indexes
#
#  index_proofs_on_course_id  (course_id)
#
FactoryBot.define do
  factory :proof do
    receipt { false }
    grade { false }
    course { nil }
  end
end
