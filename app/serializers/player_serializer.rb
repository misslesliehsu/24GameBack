class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :playerName, :game_id, :points, :ready
end
