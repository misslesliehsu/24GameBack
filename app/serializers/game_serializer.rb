class GameSerializer < ActiveModel::Serializer
  attributes :id, :counter
  has_many :players
  has_one :card
end
