class User < SitePrism::Page
  element :message, "#flash > div > p"

  def success_message
    self.message.set "#{message}"
  end

end
