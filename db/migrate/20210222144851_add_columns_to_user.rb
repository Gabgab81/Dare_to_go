class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :birth_date, :date
    add_column :users, :presentation, :text
    add_column :users, :address, :string
  end
end
