module Aqua
  CLIENT.on_message_create do |payload|
    content = payload.content.split
    if content[0] == Config["prefix"].as_s
      content.shift
      case content[0]
      when "help"
        CLIENT.create_message(payload.channel_id, "I can't help you yet, sorry")
      when "hug"
        CLIENT.create_message(payload.channel_id, "*Hugs @<#{payload.author.id}>*")
      end
    end
    if (content[0] == "hi-five") || (content[0] == "hifive") || (content[0] == "o/")
      next if payload.author.bot
      CLIENT.create_message(payload.channel_id, "o/")
    end
  end
end
