class Api::V1::GamesController < ApplicationController

  #counter; players

  def index
    @games = Game.all
    render json: @games
  end

  #when a new game is created, tell the lobby_channel
  def create
    @game = Game.new(counter: 0)
    if @game.valid
      @game.save
      ActionCable.server.broadcast("lobby_channel", @game)
    end
  end

  #when a game is updated (with new players, with cardCounter, or points), tell that game's channel
  def update
    @game = Game.find(params[:id])
    #what kind of request; then make the update, and save
    ActionCable.server.broadcast("game_channel_#{@game.id}", @game)
  end

end
