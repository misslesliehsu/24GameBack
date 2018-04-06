class Game < ApplicationRecord
  has_many :players
  has_one :card
end
