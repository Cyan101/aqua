require "./aqua/requires.cr"

Config = YAML.parse(File.read("config.yaml"))

module Aqua
  # TODO Put your code here
  CLIENT = Discord::Client.new(token: "Bot " + Config["token"].as_s, client_id: 323303029056995329_u64)

  CLIENT.on_message_create do |payload|
    if payload.content.starts_with? "!ping"
      CLIENT.create_message(payload.channel_id, "Pong!")
    end
  end

  CLIENT.run
end
