class AddWorksheetToProofs < ActiveRecord::Migration[6.0]
  def change
    add_column :proofs, :worksheet, :boolean
  end
end
