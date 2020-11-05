class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.string :sprite_front
      t.string :sprite_back
      t.int :hp_base
      t.int :atk_base
      t.int :def_base
      t.int :spa_base
      t.int :spd_base
      t.int :spe_base

      t.timestamps
    end
  end
end
