class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.string :rank
      t.integer :xp_requirement

      t.timestamps
    end
  end
end
