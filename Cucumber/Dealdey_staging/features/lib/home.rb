class Home < SitePrism::Page
  set_url "http://staging.dealdey.com"
  element :popup, "#new_city_select > a"
  element :signin_button, "#header > div.header-bottom.dd-container > div.header-right.fl > ul > li.signup > a"
  element :signup_button, "#header > div.header-bottom.dd-container > div.header-right.fl > ul > li.signin > a"

end
