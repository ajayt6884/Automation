class Signin_message < SitePrism::Page

  element :message, "#flash > div > p"
  element :emessage, "#flash > div"

  def success_message
    self.message.set "#{message}"
  end

  def error_message
    self.emessage.set "#{emessage}"
  end

end
