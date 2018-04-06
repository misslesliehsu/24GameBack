class Player < ApplicationRecord
  belongs_to :game
  validates_uniqueness_of :playerName, :scope => :game, :message => "This game already has a player with that name!"

end
