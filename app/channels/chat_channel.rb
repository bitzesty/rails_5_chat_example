class ChatChannel < ApplicationCable::Channel
  def join(data)
    stream_from channel_id(data)
  end

  def leave(data)
    stop_all_streams
  end

  def write(data)
    ActionCable.server.broadcast channel_id(data), { type: 'wrote', data: { user: current_user.to_json, message: data['message'] }}
  end

private

  def channel_id(data)
    "channel_#{data['channel_id']}"
  end
end
