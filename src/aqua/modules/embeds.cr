module Aqua
  CLIENT.on_message_create do |payload|
    content = payload.content.split
    if content[0] == Config["prefix"].as_s
      content.shift
      case content[0]
      when "embed"
        if content.size <= 1
          embedmessage = create_embed("Title", "Description")
          CLIENT.create_message(payload.channel_id, "", embedmessage)
        elsif content.size >= 4
          content.shift
          mess = content.join(" ").split("|")
          mess.delete("|")
          embedmessage = create_embed(mess[0], mess[1], mess[2]?.try(&.to_u32), mess[3]?, mess[4]?)
          CLIENT.create_message(payload.channel_id, "", embedmessage)
          # Example: ~aq embed Title! | Hello there! | 11214061 | http://i.imgur.com/1LmDmct.jpg | time
        else
          CLIENT.create_message(payload.channel_id, "Ya lost me")
        end
      end
    end
  end

  def self.create_embed(title : String, description : String, colour : UInt32? = nil, image : String? = nil,
                        time : String? = nil, footer : Array? = nil, thumb : String? = nil,
                        author : Array? = nil, field : Array? = nil)
    e_message = Discord::Embed.new(title)
    e_message.description = description
    e_message.colour = colour unless colour.nil?
    e_message.image = Discord::EmbedImage.new(image) unless image.nil?
    e_message.timestamp = Time.now if time
    e_message.footer = Discord::EmbedFooter.new(footer[0], footer[1]?) unless footer.nil?
    e_message.thumbnail = Discord::EmbedThumbnail.new(thumb) unless thumb.nil?
    e_message.author = Discord::EmbedAuthor.new(author[0], author[1]?, author[2]?) unless author.nil?
    e_message.field = Discord::EmbedField.new(field[0], field[1]?) unless field.nil?
    return e_message
  end
end
