class Countinue_shopping < SitePrism::Page

  element :countinue_shopping, "#user_cart > div.checkout-panel.step1.open.relative > div.checkout-panel-body > div.row.proceed_from_cart > table > tbody > tr > td.text-left.pt-5.pb-5 > a"


  # def select_first_option(id)
  #   first_option_xpath = "//*[@id='#{id}']/option[1]"
  #   first_option = find(:xpath, first_option_xpath).text
  #   select(first_option, :from => id)
  # end


end
