module SessionsHelper
  def flash_message(key)
    if flash[key]
      content_tag :p, flash[key], class: 'flash alert'
    end
  end
end
