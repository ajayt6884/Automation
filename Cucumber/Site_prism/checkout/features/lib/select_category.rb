class Select_category < SitePrism::Page

  element :category, "#city-travel > a > span > span"
  element :fashion_category, "#fashion > a > span > span"

  def select_cat
    self.category.set "#{ category }"
  end

end
