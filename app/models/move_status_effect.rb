class MoveStatusEffect < ApplicationRecord
  belongs_to :status_effect
  belongs_to :move
end
