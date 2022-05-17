class AddIsAdminToUsers < ActiveRecord::Migration[6.1]
  def up
    change_column  :users, :is_admin, :boolean, default: false
  end

  def down
    change_column  :users, :is_admin, :boolean, default: false
  end
end
