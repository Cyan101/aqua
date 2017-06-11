module Aqua
  CLIENT.on_message_create do |payload|
    if payload.content == "!ms"
      # We first create a new Message, and then we check how long it took to send the message by comparing it to the current time
      message = CLIENT.create_message(payload.channel_id, "Pong!")
      time = Time.utc_now - payload.timestamp
      CLIENT.edit_message(message.channel_id, message.id, "Pong! Time taken: #{time.total_milliseconds} ms.")
    end
  end
end
