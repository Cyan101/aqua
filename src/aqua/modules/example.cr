module Aqua
  prefix = Config["prefix"].as_s + ' '

  CLIENT.on_message_create do |payload|
    command = payload.content
    case command
    when prefix + "help"
      CLIENT.create_message(payload.channel_id, "I can't help you yet, sorry")
    when prefix + "hi-five", prefix + "hifive", "o/"
      next if payload.author.bot
      CLIENT.create_message(payload.channel_id, "o/")
    end
  end
end
