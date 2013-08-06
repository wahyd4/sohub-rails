module WeixinService

  def reply_text_message(message, content)
    reply_message = build_reply(message)
    reply_message.content = 'test me!'

    builder = Nokogiri::XML::Builder.new do |xml|
      xml.xml {
        xml.FromUserName reply_message.from_user
        xml.ToUserName reply_message.to_user
        xml.CreateTime reply_message.create_time
        xml.MsgType reply_message.message_type
        xml.Content reply_message.content
        xml.FuncFlag 0
      }
    end
    builder.to_xml
  end

  def build_reply(message)
    reply_message = Message.new
    reply_message.create_time = Time.now.to_i
    reply_message.from_user = message.to_user
    reply_message.to_user = message.from_user
    reply_message.message_type = message.message_type
    reply_message.save
  end

  def parse_xml(xml_string)
    xml = Nokogiri::XML(xml_string)
    message = Message.new
    message.from_user = xml.xpath('//FromUserName').text
    message.to_user = xml.xpath('//ToUserName').text
    message.message_type = xml.xpath('//MsgType').text
    message.content = xml.xpath('//Content').text
    message.message_id = xml.xpath('//MsgId').text
    message.save
    message
  end

  def parse_xml_to_hash(xml)
    message = Message.new
    message.from_user = xml[:FromUserName]
    message.to_user = xml[:ToUserName]
    message.message_type = xml[:MsgType]
    message.content = xml[:Content]
    message.message_id = xml[:MsgId]
    message.save
    message
  end
end