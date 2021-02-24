# == Schema Information
#
# Table name: credentials
#
#  id           :integer          not null, primary key
#  auto_approve :boolean
#  description  :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  degree_id    :integer
#
# Indexes
#
#  index_credentials_on_degree_id  (degree_id)
#
# Foreign Keys
#
#  degree_id  (degree_id => degrees.id)
#
require 'rails_helper'

RSpec.describe Credential, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
