class Api::V1::GamesController < ApplicationController

  #counter; players
  def index
    @activeGames = Game.all.select do |g|
      g.counter == 0
    end
    render json: @activeGames
  end


  #when a new game is created, tell the lobby_channel
  def create
    @game = Game.new(counter: 0)
    if @game.valid?
      @game.save
      ActionCable.server.broadcast("new_games", @game)
    end
    render json: @game
  end

  #when a game is updated (with new players, with cardCounter, or points), tell that game's channel
  def update
    @game = Game.find(params[:id])
    #what kind of request; then make the update, and save
    ActionCable.server.broadcast("game_channel_#{@game.id}", @game)
  end

end