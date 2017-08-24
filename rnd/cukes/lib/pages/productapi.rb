

class ProductApi
  include PageObject
  PageObject.javascript_framework = :jquery

  def getproduct
  http = HTTPClient.new
  res = http.get('http://rocksanddolls:@l3rt@lw@ys@rnd.domain4now.com/api/products')
  res.status
  end
end