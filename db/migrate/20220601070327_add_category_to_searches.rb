class AddCategoryToSearches < ActiveRecord::Migration[6.1]
  def change
    add_column :searches, :category, :string
  end
end
