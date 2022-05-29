class CreateHides < ActiveRecord::Migration[6.1]
  def change
    create_table :hides do |t|
      t.boolean :is_hide
      t.references :user, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
