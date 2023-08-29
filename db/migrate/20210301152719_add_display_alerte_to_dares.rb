class AddDisplayAlerteToDares < ActiveRecord::Migration[6.0]
  def change
    add_column :dares, :display_alerte, :integer, default: 0, null: false
  end
end
