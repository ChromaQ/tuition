class AddGoalToApproval < ActiveRecord::Migration[6.0]
  def change
    add_reference :approvals, :goal, foreign_key: true, null: true
    add_reference :approvals, :proof, foreign_key: true, null: true
  end
end
