class AddDirectionToTrainer < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :direction, :string
  end
end
