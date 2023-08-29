class AddInscriptionToChallenge < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :incription, :date
  end
end
