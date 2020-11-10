class AddCoordinateXToTrainer < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :coordinate_x, :float
  end
end
