class AddCategoryToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :category, :string
  end
end
