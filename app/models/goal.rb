# frozen_string_literal: true

# == Schema Information
#
# Table name: goals
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(TRUE)
#  focus         :string(4000)
#  status        :integer          default(0), not null
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
  has_many :approvals, dependent: :destroy

  attr_writer :degree_id

  enum status: { draft: 0, pending: 1, denied: 2, approved: 3, auto_approved: 4 }

  after_create :goal_autoapproval

  # == Validations ====================================
  validates :credential_id, presence: true
  validates :user_id, presence: true
  validates :school_id, presence: true
  validates :focus, presence: true, unless: proc { |goal| goal.credential.auto_approve? }

  # == Scopes =========================================
  scope :credential_autoapproved, -> { where(credential.auto_approve = true) }

  # == InstanceMethods ===================================
  # Summarize the fields for sake of convenience and consistent display
  def goal_details
    "#{credential.name}" ' - ' "#{credential.description}" ' from ' "#{school.name}"
  end

  # For School Autocomplete feature
  def school_name
    school&.name
  end

  # For populating the credentials associated with a degree id
  def degree_id
    credential&.degree_id || @degree_id
  end

  # For populating the credentials associated with a degree id
  def degree_id=(degree_id)
    @degree_id = degree_id
  end

  # Goal is auto_approvable if the goal's associated credential is set to auto_approve = true by HR
  def auto_approvable?
    credential&.auto_approve?
  end

  # Used when a goal is auto_approvable and in pending status. An approval record is made for consistency just like manual approvals and denials.
  def goal_autoapproval
    if pending? && auto_approvable?
      approval = Approval.new(goal_id: id, response: 'approved', role: 'auto_approval')
      approval.save!
      self.auto_approved!
    else
      true
    end
  end

  # once hr manually approves goal, update goal status to approved after creating an approval record
  def approve_goal(approved_by)
    approval = Approval.new(goal_id: id, user_id: approved_by.id, employee_id: approved_by.employee_id, response: 'approved', role: 'human_resources')
    if approval.save
      self.approved!
      true
    else
      false
    end
  end
end

