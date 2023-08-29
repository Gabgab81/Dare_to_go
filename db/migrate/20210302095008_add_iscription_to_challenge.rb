class AddIscriptionToChallenge < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :inscription, :integer
  end
end
