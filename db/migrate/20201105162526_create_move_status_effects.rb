class CreateMoveStatusEffects < ActiveRecord::Migration[6.0]
  def change
    create_table :move_status_effects do |t|
      t.references :status_effect, null: false, foreign_key: true
      t.references :move, null: false, foreign_key: true
      t.integer :accuracy

      t.timestamps
    end
  end
end
