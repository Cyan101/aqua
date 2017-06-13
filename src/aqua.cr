require "./aqua/requires.cr"

Config = YAML.parse(File.read("config.yaml"))

module Aqua
  CLIENT = Discord::Client.new(token: "Bot " + Config["token"].as_s, client_id: 323303029056995329_u64)

  CLIENT.on_message_create do |payload|
    admin = true if payload.author.id == Config.["owner_id"].as_s.to_u64
    if admin
      content = payload.content.split
      case content[0]
      when "~cr"
        content.shift
        code = "crystal eval '#{content.join(" ")}'"
        output = `#{code}`.chomp
        CLIENT.create_message(payload.channel_id, output)
      when "~rb"
        content.shift
        code = "ruby -e '#{content.join(" ")}'"
        output = `#{code}`.chomp
        CLIENT.create_message(payload.channel_id, output)
      when "~say"
        content.shift
        CLIENT.create_message(payload.channel_id, content.join(" "))
      when "~hide"
        CLIENT.create_message(payload.channel_id, "*Returns to the shadows...*")
        CLIENT.status_update("invisible")
      end
    end
  end

  CLIENT.run
end
