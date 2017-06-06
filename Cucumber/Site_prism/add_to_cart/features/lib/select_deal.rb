class Select_deal < SitePrism::Page
  element :deal, "#deal_3693 > div.imageBlock.relative.text-center > div.image > a"
  element :deal2, "#deal_4392 > div.imageBlock.relative.text-center > div > a > img"

  def select_deal
    self.deal.set "#{ deal }"
  end
end
