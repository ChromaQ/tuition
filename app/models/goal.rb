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
  has_many :approvals

  attr_writer :degree_id

  # attr_reader :school_name

  enum status: { draft: 0, pending: 1, denied: 2, auto_approved: 3, approved: 4, withdrawn: 5 }

  # == Validations ====================================
  validates :credential_id, presence: true
  validates :user_id, presence: true
  validates :school_id, presence: true
  validates :focus, presence: true, unless: proc { |goal| goal.credential.auto_approve? }


  def goal_details
    "#{credential.name}" ' - ' "#{credential.description}" ' from ' "#{school.name}"
  end

  def school_name
    self.school&.name
  end

  def degree_id
    credential&.degree_id || @degree_id
  end

  def degree_id=(degree_id)
    @degree_id = degree_id
  end

  # once hr approves goal, update goal status to approved after creating an approval record
  def approve_goal(approved_by)
    approval = Approval.new(goal_id: self.id, user_id: approved_by.id, employee_id: approved_by.employee_id, response: 'approved', role: 'human_resources')
    if approval.save
      self.approved!
      true
    else
      false
    end
  end

end
