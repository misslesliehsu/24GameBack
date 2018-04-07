class Api::V1::PlayersController < ApplicationController
  #gameId, #playerName

  def index
    @players = Game.find(params[:game_id]).players
    render json: @players
  end

  #when a new game is created, tell the lobby_channel
  def create
    @player = Player.new(game_id: params[:game_id], playerName:params[:playerName], points: 0, ready: false)
    if @player.valid?
      @player.save
      render status: 200, json: @player
      ActionCable.server.broadcast("game_channel_#{@player.game_id}", {type: "newPlayer", payload: @player})
    else
      render status: 400, json: @player.errors.full_messages
    end
  end

  def update
    @player = Player.find(params[:id])
    @player.update(player_params)
    @players = Game.find(@player.game_id).players
    ActionCable.server.broadcast("game_channel_#{@player.game_id}", {type: "readinessUpdate", payload: @players})
    if @players.all? do |p|
      p.ready === true
      end
    then
      @game = Game.find(@player.game_id)
      if @game.counter == 0
        @game.update(counter: 1)
        @card = Card.create!(num1: 1, num2:2, num3: 3, num4: 4, winnerId: nil, game_id: @game.id)
        ActionCable.server.broadcast("game_channel_#{@game.id}", {type: "firstTurn", payload: @card})
      else
        @card = @game.card
        @card.update(num1: 3, num2:4, num3: 5, num4: 7, winnerId: nil, game_id: @game.id)
        ActionCable.server.broadcast("game_channel_#{@game.id}", {type: "newCard", payload: @card})
      end
    end
  end


private

  def player_params
    params.require(:player).permit(:playerName, :id, :points, :ready)
  end

end
