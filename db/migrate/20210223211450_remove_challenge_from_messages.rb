class RemoveChallengeFromMessages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :messages, :challenge, null: false, foreign_key: true
  end
end
