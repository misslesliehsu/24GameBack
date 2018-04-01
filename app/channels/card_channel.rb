class CardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "card_channel_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
