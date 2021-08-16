class AddColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :approved, :boolean, default: false
  end
end
