class Api::V1::CardsController < ApplicationController

  #numbers; winner_id; gameId

  def create
    @set = Card.sets.sample
    @card = Card.new(num1:@set[0], num2:@set[1], num3:@set[2], num4:@set[3], winnerId:nil, game_id: params[:gameId])
    if @card.valid?
      @card.save
      ActionCable.server.broadcast("card_channel_#{@card.id}", @card)
    end
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
