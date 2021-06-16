# frozen_string_literal: true

# == Schema Information
#
# Table name: degrees
#
#  id         :bigint           not null, primary key
#  name       :string(4000)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Degree < ApplicationRecord
  has_many :credentials
end
