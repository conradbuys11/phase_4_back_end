class CreateTrainerCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :trainer_categories do |t|
      t.string :name
      t.string :front_sprite
      t.string :back_sprite
      t.string :left_sprite
      t.string :right_sprite
      t.string :front_walk_one
      t.string :back_walk_one
      t.string :left_walk_one
      t.string :right_walk_one
      t.string :front_walk_two
      t.string :back_walk_two
      t.string :left_walk_two
      t.string :right_walk_two

      t.timestamps
    end
  end
end
