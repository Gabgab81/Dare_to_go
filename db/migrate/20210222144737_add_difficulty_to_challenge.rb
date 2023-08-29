class AddDifficultyToChallenge < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :difficulty, :integer
  end
end
