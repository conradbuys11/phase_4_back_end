class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer :current_hp
      t.references :status_effect, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true
      t.text :stat_modifiers

      t.timestamps
    end
  end
end
