class AddPriceToSearches < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :price, :integer
  end
end
