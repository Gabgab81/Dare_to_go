class ChangeProgressInDares < ActiveRecord::Migration[6.0]
  def change
    change_column :dares, :progress, :integer, null: false, default: 0
  end
end
