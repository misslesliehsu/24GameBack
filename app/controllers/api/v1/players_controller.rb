class Api::V1::PlayersController < ApplicationController
  #gameId, #playerName

  #when a new game is created, tell the lobby_channel
  def create
    @player = Player.new(gameId: params[:gameId], playerName:params[:playerName], points: 0)
    if @player.valid?
      @player.save
      ActionCable.server.broadcast("game_channel_#{@player.gameId}", @player)
    end
  end

end
