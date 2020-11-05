class Pokemon < ApplicationRecord
  belongs_to :status_effect
  belongs_to :species
  has_many :pokemon_moves
  has_many :moves, through: :pokemon_moves
end
