class Api::V1::GamesController < ApplicationController

  #counter; players
  def index
    @activeGames = Game.all.select do |g|
      g.counter == 0
    end
    render json: @activeGames
  end


  def show
    @game = Game.find(params[:id])
    render json: @game
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
    @game.update(counter: @game.counter + 1)
    @player = Player.find(params[:winnerId])
    @player.update(points: @player.points + 10)
    @players = @game.players
    @players.each do |p|
      p.ready = false
    end
    ActionCable.server.broadcast("game_channel_#{@game.id}", {type: "pointsUpdateAndCardTurn", payload: {players: @players, counter: @game.counter}})
  end

end
