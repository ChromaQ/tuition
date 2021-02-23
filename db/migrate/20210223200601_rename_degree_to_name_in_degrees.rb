class RenameDegreeToNameInDegrees < ActiveRecord::Migration[5.2]
  def up
    rename_column :degrees, :degree, :name
    rename_column :credentials, :credential, :name
  end

  def down
    rename_column :degrees, :name, :degree
    rename_column :credentials, :name, :credential
  end
end
