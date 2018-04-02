class LobbyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "new_games"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
