class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.references :type, null: false, foreign_key: true
      t.string :category
      t.integer :power
      t.integer :accuracy

      t.timestamps
    end
  end
end
