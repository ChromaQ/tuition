# == Schema Information
#
# Table name: degrees
#
#  id         :bigint           not null, primary key
#  name       :varchar(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Degree, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
