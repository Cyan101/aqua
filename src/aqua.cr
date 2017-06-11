require "./aqua/*"
require "discordcr"

module Aqua
  # TODO Put your code here
  bot_token = File.read("bot_token.txt")
  client = Discord::Client.new(token: "Bot " + bot_token.strip, client_id: 323303029056995329_u64)

  client.on_message_create do |payload|
    if payload.content.starts_with? "!ping"
      client.create_message(payload.channel_id, "Pong!")
    end
  end

client.run
end
