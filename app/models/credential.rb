# frozen_string_literal: true

# == Schema Information
#
# Table name: credentials
#
#  id           :bigint           not null, primary key
#  auto_approve :boolean
#  description  :varchar(200)
#  name         :varchar(50)
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

  # == Relationships ==================================
  belongs_to :degree
  has_many :goals

  # == Validations ====================================
  validates :name, presence: true
  validates :description, presence: true
  validates :degree_id, presence: true

  # == Scopes =========================================
  scope :is_auto_approve, -> { where(auto_approve: true) }
  scope :not_auto_approve, -> { where(auto_approve: false) }

  # == Class Methods ====================================
  # Return the credentials that have a given degree id
  def self.from_degree(degree_id)
    where(degree_id: degree_id)
  end

  # == Instance Methods ====================================

  # Return the credential abbreviation (name) and the credential description for convenience
  def full_info
    "#{name}" ' - ' "#{description}"
  end

  def autoapprove?
    auto_approve == true
  end


end
