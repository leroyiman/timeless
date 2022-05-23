class AddFnameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :phone, :string
    add_column :users, :location, :string
    add_column :users, :is_admin, :boolean
  end
end
