class Buy_deal < SitePrism::Page

  #element :dropdown, "#Color"#Color
  element :option_value, '#\31 69'
  element :buy, "#add_to_cart_form > span > input"

  def buy_from
    self.dropdown.set "#{dropdown}"
    # self.option_value.set "#{ option_value }"
    # self.buy.set "#{ buy }"
  end

end
