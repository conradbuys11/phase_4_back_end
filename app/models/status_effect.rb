class StatusEffect < ApplicationRecord
    has_many :move_status_effects
    has_many :moves, through: :move_status_effects
    has_many :pokemons
end
