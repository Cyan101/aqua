module Aqua
  prefix = Config["prefix"].as_s + ' '

  CLIENT.on_message_create do |payload|
    command = payload.content
    case command
    when prefix + "kitty"
      response = HTTP::Client.get "http://random.cat/meow"
      link = JSON.parse(response.body)["file"]
      CLIENT.create_message(payload.channel_id, link.as_s) # "#{link}" probably looks a bit nicer
    when prefix + "kawaii", prefix + "cutie"
      CLIENT.upload_file(payload.channel_id, "", File.open("src/aqua/images/cutie.png")) # "#{link}" probably looks a bit nicer
    end
  end
end
