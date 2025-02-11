# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_06_191648) do

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.datetime "sent_at"
    t.integer "vehicle_id", null: false
    t.boolean "is_actual"
    t.index ["vehicle_id"], name: "index_locations_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "idVehicle", null: false
    t.index ["idVehicle"], name: "index_vehicles_on_idVehicle", unique: true
  end

  add_foreign_key "locations", "vehicles"
end
