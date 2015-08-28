class ChatChannel < ApplicationCable::Channel
  def join(data)
    logger.debug(data)
    stream_from channel_id(data)
  end

  def leave(data)
    logger.debug(data)
    stop_all_streams
  end

  def write(data)
    logger.debug("write(#{data})")
    logger.debug("for user #{current_user}")
    logger.debug("for user #{connection.current_user}")

    ActionCable.server.broadcast channel_id(data), { type: 'wrote', data: { user: current_user.to_json, text: data['text'] }}
  end

private

  def channel_id(data)
    "channel_#{data['channel_id']}"
  end
end
