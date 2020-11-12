class AddIconToSpecies < ActiveRecord::Migration[6.0]
  def change
    add_column :species, :icon, :string
  end
end
