class CreateTimeslots < ActiveRecord::Migration[6.1]
  def change
    create_table :timeslots do |t|
      t.datetime :timeslot
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
