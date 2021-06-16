# == Schema Information
#
# Table name: credentials
#
#  id           :bigint           not null, primary key
#  auto_approve :boolean
#  description  :string(4000)
#  name         :string(4000)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  degree_id    :bigint
#
# Indexes
#
#  index_credentials_on_degree_id  (degree_id)
#
# Foreign Keys
#
#  fk_rails_...  (degree_id => degrees.id)
#
require 'rails_helper'

RSpec.describe Credential, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
