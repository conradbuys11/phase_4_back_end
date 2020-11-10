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

ActiveRecord::Schema.define(version: 2020_11_10_165747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "move_status_effects", force: :cascade do |t|
    t.bigint "status_effect_id", null: false
    t.bigint "move_id", null: false
    t.integer "accuracy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["move_id"], name: "index_move_status_effects_on_move_id"
    t.index ["status_effect_id"], name: "index_move_status_effects_on_status_effect_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.bigint "type_id", null: false
    t.string "category"
    t.integer "power"
    t.integer "accuracy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_moves_on_type_id"
  end

  create_table "pokemon_moves", force: :cascade do |t|
    t.bigint "move_id", null: false
    t.bigint "pokemon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["move_id"], name: "index_pokemon_moves_on_move_id"
    t.index ["pokemon_id"], name: "index_pokemon_moves_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "current_hp"
    t.bigint "status_effect_id"
    t.bigint "species_id", null: false
    t.text "stat_modifiers"
    t.bigint "trainer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["species_id"], name: "index_pokemons_on_species_id"
    t.index ["status_effect_id"], name: "index_pokemons_on_status_effect_id"
    t.index ["trainer_id"], name: "index_pokemons_on_trainer_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "sprite_front"
    t.string "sprite_back"
    t.integer "hp_base"
    t.integer "atk_base"
    t.integer "def_base"
    t.integer "spa_base"
    t.integer "spd_base"
    t.integer "spe_base"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "species_types", force: :cascade do |t|
    t.bigint "species_id", null: false
    t.bigint "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["species_id"], name: "index_species_types_on_species_id"
    t.index ["type_id"], name: "index_species_types_on_type_id"
  end

  create_table "status_effects", force: :cascade do |t|
    t.string "name"
    t.integer "accuracy"
    t.integer "power"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trainer_categories", force: :cascade do |t|
    t.string "name"
    t.string "front_sprite"
    t.string "back_sprite"
    t.string "left_sprite"
    t.string "right_sprite"
    t.string "front_walk_one"
    t.string "back_walk_one"
    t.string "left_walk_one"
    t.string "right_walk_one"
    t.string "front_walk_two"
    t.string "back_walk_two"
    t.string "left_walk_two"
    t.string "right_walk_two"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.boolean "is_defeated"
    t.bigint "trainer_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "coordinate_x"
    t.float "coordinate_y"
    t.string "direction"
    t.index ["trainer_category_id"], name: "index_trainers_on_trainer_category_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.integer "double_against"
    t.integer "half_against"
    t.integer "immune_against"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "move_status_effects", "moves"
  add_foreign_key "move_status_effects", "status_effects"
  add_foreign_key "moves", "types"
  add_foreign_key "pokemon_moves", "moves"
  add_foreign_key "pokemon_moves", "pokemons"
  add_foreign_key "pokemons", "species"
  add_foreign_key "pokemons", "status_effects"
  add_foreign_key "pokemons", "trainers"
  add_foreign_key "species_types", "species"
  add_foreign_key "species_types", "types"
  add_foreign_key "trainers", "trainer_categories"
end
