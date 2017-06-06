class Signup_message < SitePrism::Page

  element :popup_code, "body > div.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.hideTitle.ui-draggable > div.ui-dialog-titlebar.ui-widget-header.ui-corner-all.ui-helper-clearfix > a >span"
  element :message, "#flash > div > p"
  element :emessage, "#new_user > li:nth-child(2) > dl > dd:nth-child(2) > span.error > p"
  element :pmessage, "#new_user > li:nth-child(2) > dl > dd:nth-child(4) > span > p"
  element :momessage, "#new_user > li:nth-child(2) > dl > dd:nth-child(5) > span.error > p"

  def popup
    self.popup_code.set "#{popup_code}"
  end

  def success_message
    self.message.set "#{message}"
  end

  def email_message
    self.emessage.set "#{emessage}"
  end

  def password_message
    self.pmessage.set "#{pmessage}"
  end

  def mobile_message
    self.momessage.set "#{momessage}"
  end

end
