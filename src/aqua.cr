require "discordcr"
require "yaml"
require "./aqua/modules/*"
require "./aqua/*"

Config = YAML.parse(File.read("config.yaml"))


module Aqua

  # TODO Put your code here
  bot_token = File.read("bot_token.txt")
  CLIENT = Discord::Client.new(token: "Bot " + Config["token"], client_id: 323303029056995329_u64)

  CLIENT.on_message_create do |payload|
    if payload.content.starts_with? "!ping"
      CLIENT.create_message(payload.channel_id, "Pong!")
    end
  end

  CLIENT.run
end
