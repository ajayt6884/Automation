class Home < SitePrism::Page
  set_url "http://staging.dealdey.com"
  element :popup, "html body.touch-disabled div.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.splash-screen.hideTitle.ui-draggable div#new_city_select.ui-dialog-content.ui-widget-content a.no-subscription"

  def close_n_open
    popup.set "#{popup}"
    signin_button.set "#{signin_button}"
  end

end
