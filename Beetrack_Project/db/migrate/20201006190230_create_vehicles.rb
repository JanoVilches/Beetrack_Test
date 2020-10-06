class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :idVehicle, null: false
    end

    add_index :vehicles, :idVehicle, unique: true
  end
end
