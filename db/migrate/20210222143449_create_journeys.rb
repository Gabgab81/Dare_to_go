class CreateJourneys < ActiveRecord::Migration[6.0]
  def change
    create_table :journeys do |t|
      t.string :title
      t.text :content
      t.boolean :public
      t.integer :challenge_rating
      t.text :challenge_review
      t.references :user, null: false, foreign_key: true
      t.references :dare, null: false, foreign_key: true

      t.timestamps
    end
  end
end
