# frozen_string_literal: true

# == Schema Information
#
# Table name: degrees
#
#  id         :bigint           not null, primary key
#  name       :varchar(50)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Degree < ApplicationRecord
  has_many :credentials

  # enum name: { other: 0, certificate: 1, associate: 2, bachelor: 3, master: 4, doctorate: 5, engineering: 6 }

  # == Scopes =========================================

end
