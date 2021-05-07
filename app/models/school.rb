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
class School < ApplicationRecord
  has_many :goals
end
