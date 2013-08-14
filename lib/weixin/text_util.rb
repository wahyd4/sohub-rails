module TextUtil
  def is_help(content)
    content == 'h' || content == 'help'
  end

  def is_menu(content)
    content == 'm'||content == 'menu'
  end

  def is_normal_message(content)
    content.match('^[-]{1}[^-+]+$') != nil
  end

  def is_notice(content)
    content.match('^[+]{1}[^+-]+$')!=nil
  end

  def is_set_name(content)
    content.match('^[=]{1}[^=+-]+$')!=nil
  end

  def replace_symbol!(content)
    content.gsub!(/[-+=]/, '') if content!= nil
  end

  def is_set_avatar(content)
    content == '头像'
  end

  def is_set_current_hub(content)
    content.match('^[#]{1}\d{1,5}$')!=nil
  end

  def get_current_hub(content)
      content.gsub(/[#]/,'').to_i
  end

end