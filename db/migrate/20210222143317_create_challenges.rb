class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.integer :category
      t.integer :place
      t.text :content
      t.integer :xp
      t.integer :delay

      t.timestamps
    end
  end
end
