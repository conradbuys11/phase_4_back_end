class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :name
      t.integer :value
      t.integer :double_against
      t.integer :half_against
      t.integer :immune_against

      t.timestamps
    end
  end
end
