class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.datetime :sent_at
      t.references :vehicle, null: false, foreign_key: true
      t.boolean :is_actual
    end
  end
end
