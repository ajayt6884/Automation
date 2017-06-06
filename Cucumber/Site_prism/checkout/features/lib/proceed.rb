class Proceed < SitePrism::Page
  element :proceed1, "#user_cart > div.checkout-panel.step1.open.relative > div.checkout-panel-body > div.row.proceed_from_cart > table > tbody > tr > td.text-right.pt-5.pb-5 > div > form > div > input.btn.btn-action.proceed.size-14.radius-5"
  element :proceed2, "#user_cart > div.checkout-panel.step2.open > div.checkout-panel-body > div > table > tbody > tr > td.text-right.pt5.pb5 > a"
end
