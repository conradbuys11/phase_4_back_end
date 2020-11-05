class Type < ApplicationRecord
    has_many :species_types
    has_many :species, through: :species_types
    has_many :moves
end
