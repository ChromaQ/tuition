# frozen_string_literal: true

# == Schema Information
#
# Table name: goals
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(TRUE)
#  focus         :string(4000)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  credential_id :bigint
#  school_id     :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_goals_on_credential_id  (credential_id)
#  index_goals_on_school_id      (school_id)
#  index_goals_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (credential_id => credentials.id)
#  fk_rails_...  (school_id => schools.id)
#  fk_rails_...  (user_id => users.id)
#
class Goal < ApplicationRecord

  # == Relationships ==================================
  belongs_to :user
  belongs_to :school
  belongs_to :credential
  has_many :courses
  has_many :approvals

  # == Validations ====================================
  validates :credential_id, presence: true
  validates :user_id, presence: true
  validates :school_id, presence: true


  def goal_details
    "#{credential.name}" ' - ' "#{credential.description}" ' from ' "#{school.name}"
  end

  def degree_id
    self.credential&.degree_id || @degree_id
  end

  def degree_id=(degree_id)
    @degree_id = degree_id
  end


end
