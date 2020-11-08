class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :location
      t.boolean :is_defeated
      t.references :trainer_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
