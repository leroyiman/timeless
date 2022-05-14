class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :size
      t.string :condition
      t.string :style
      t.integer :price
      t.string :material
      t.boolean :smoke_free
      t.boolean :pet_free
      t.boolean :receipt
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
