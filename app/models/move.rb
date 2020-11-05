class Move < ApplicationRecord
  belongs_to :type
  has_many :move_status_effects
  has_many :status_effects, through: :move_status_effects
  has_many :pokemon_moves
  has_many :pokemons, through: :pokemon_moves
end
