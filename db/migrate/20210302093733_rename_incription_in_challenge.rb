class RenameIncriptionInChallenge < ActiveRecord::Migration[6.0]
  def change
     rename_column :challenges, :incription, :inscription
  end
end
