class AddConfirmedToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :confirmed, :string
  end
end
