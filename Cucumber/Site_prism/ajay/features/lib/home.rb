class Home < SitePrism::Page
  set_url "http://staging.dealdey.com/deals/erp-disabled-new-deal"
  element :popup, "#new_city_select > a"
  # element :signin_button, "#header > div.header-bottom.dd-container > div.header-right.fl > ul > li.signin > a"

   def close_n_open
    popup.set "#{popup}"
    #signin_button.set "#{signin_button}"
  end

end
