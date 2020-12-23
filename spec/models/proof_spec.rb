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
require 'rails_helper'

RSpec.describe Proof, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
