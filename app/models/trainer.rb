class Trainer < ApplicationRecord
  belongs_to :trainer_category
  has_many :pokemons
end
