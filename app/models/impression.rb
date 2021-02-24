# frozen_string_literal: true

# == Schema Information
#
# Table name: impressions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  target_id  :integer
#  user_id    :integer
#
# Indexes
#
#  index_impressions_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Impression < ApplicationRecord
  # == Constants =====================================

  # == Extensions ====================================

  # == Relationships =================================
  belongs_to :user
  belongs_to :target, class_name: 'User'
  delegate :displayname, to: :user, prefix: true
  delegate :displayname, to: :target, prefix: true

  # == Validations ===================================
  validates :user, presence: true
  validates :target, presence: true

  # == Scopes ========================================
  scope :get_list, -> { includes(:user, :target).references(:user, :target).order(created_at: :desc) }

  # == Callbacks =====================================

  # == Class Methods =================================

  # == Instance Methods ==============================
end
