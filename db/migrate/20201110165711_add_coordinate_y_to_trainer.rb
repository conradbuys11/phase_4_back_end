class AddCoordinateYToTrainer < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :coordinate_y, :float
  end
end
