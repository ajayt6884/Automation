class User_order < SitePrism::Page
  element :message, "#wrapper > div.layout-wrapper > div.accountPage > div > h6"

  def success_message
    self.message.set "#{message}"
  end
end

