class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :category
      t.string :photos
      t.integer :daily_price
      t.string :city
      t.integer :docking_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
