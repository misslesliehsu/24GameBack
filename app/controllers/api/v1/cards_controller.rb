class Api::V1::CardsController < ApplicationController

  #numbers; winner_id; gameId
  def create
    @card = Card.new(num1:1, num2:2, num3:3, num4:4, winnerId:nil, game_id: params[:gameId])
    if @card.valid?
      @card.save
      ActionCable.server.broadcast("card_channel_#{@card.id}", @card)
  end

  def update
    @card = Card.find(params[:id])
    @card.update(winnerId: params[:winnerId])
    ActionCable.server.broadcast("card_channel_#{@card.id}", @card.winnerId)
  end

  # private
  # def card_params
  #   params.require(:card).permit(:num1, :num2, :num3, :num4, :winnerId, :gameId)
  # end


end
