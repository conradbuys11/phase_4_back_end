class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :sprite_front
      t.string :sprite_back
      t.integer :hp_base
      t.integer :atk_base
      t.integer :def_base
      t.integer :spa_base
      t.integer :spd_base
      t.integer :spe_base

      t.timestamps
    end
  end
end
