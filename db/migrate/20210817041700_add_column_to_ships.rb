class AddColumnToShips < ActiveRecord::Migration[6.0]
  def change
    add_column :ships, :description, :text
  end
end
