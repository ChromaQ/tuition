# == Schema Information
#
# Table name: proofs
#
#  id         :bigint           not null, primary key
#  grade      :boolean
#  receipt    :boolean
#  status     :integer          not null
#  worksheet  :boolean
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
require 'rails_helper'

RSpec.describe Proof, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
