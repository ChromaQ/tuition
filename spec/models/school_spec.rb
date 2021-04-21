# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  aka        :string
#  city       :string
#  name       :string           not null
#  opeid      :string
#  operating  :boolean          default(TRUE)
#  state      :string(30)
#  unitid     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe School, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
