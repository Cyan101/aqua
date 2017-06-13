module Aqua
  prefix = Config["prefix"].as_s + ' '

  CLIENT.on_message_create do |payload|
    command = payload.content
    case command
    when prefix + "kitty"
      response = HTTP::Client.get "http://random.cat/meow"
      link = JSON.parse(response.body)["file"]
      CLIENT.create_message(payload.channel_id, link.to_s) # "#{link}" probably looks a bit nicer
    end
  end
end
