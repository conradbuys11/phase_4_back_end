class Species < ApplicationRecord
    has_many :species_types
    has_many :types, through: :species_types
end
