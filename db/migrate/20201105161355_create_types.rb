class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :name
      t.int :value
      t.int :double_against
      t.int :half_against
      t.int :immune_against

      t.timestamps
    end
  end
end
