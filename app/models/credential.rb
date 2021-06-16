# frozen_string_literal: true

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
class Credential < ApplicationRecord
  belongs_to :degree
  has_many :courses
  has_many :goals

  def full_info
    "#{name}" ' - ' "#{description}"
  end
end
