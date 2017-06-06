class Signout < SitePrism::Page
  element :signout, "#dropdown_detail > li:nth-child(5) > a"

  def signout_from
    self.signout.set "#{signout}"
  end
end
