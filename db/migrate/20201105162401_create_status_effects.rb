class CreateStatusEffects < ActiveRecord::Migration[6.0]
  def change
    create_table :status_effects do |t|
      t.string :name
      t.integer :accuracy
      t.integer :power
      t.integer :duration

      t.timestamps
    end
  end
end
