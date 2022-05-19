class AddDefaultToConfirmed < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :is_confirmed, :boolean, default: false
  end
end
