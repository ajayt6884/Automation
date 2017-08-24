

class Spree
  include HTTParty
  include Product
  include ProductProperty
  include ProductVariant
  include Zone
  include Address
  include Country
  include Order
  include Taxonomy
  include StockApi
  include Checkout
  base_uri 'rnd.domain4now.com/api'
  
  def initialize()
    @auth = {:username => "rocksanddolls", :password => "@l3rt@lw@ys"}
    @@response = 0
    @token = "token=f3c9c1708ee7e426a90225c2d5cec57a22a3722e1bf73ab9"
    @usertoken = "token=3f47ed8b92e7feaee588c7c855d9bdd4bd35706fda8bb53e"  #vijay1@mailinator.com
    @tmp0 = ''
    @tmp1 = ''
    @property_id = 0
    @variant_sku = 0
    @variant_id = 0
    @orders = ["id","number","item_total","total","state","adjustment_total","user_id","created_at","updated_at","completed_at","payment_total","shipment_state","payment_state","email","special_instructions"]
    @orderdetails = ["id","number","item_total","display_item_total","total","state","adjustment_total","user_id","created_at","updated_at","completed_at","payment_total","shipment_state","payment_state","email","special_instructions", "total_quantity", "token", "line_items", "adjustments", "payments" ,"shipments","bill_address", "ship_address", "credit_cards"] 
    @lineitems = ["id","quantity","price","single_display_amount","total","display_total","variant_id","variant","id","name","count_on_hand","sku","price","weight","height","width","depth","is_master","cost_price","permalink","option_values","images","description"]
    @lineitem_id = 0
    @shipment = []
    @adjustments = []
    @payments = []
    @ordernumber = 0
    @taxonomy_id = 0
    @taxon_id = 0
    @stock_location = ["id", "name", "address1", "address2", "city", "state_id", "state_name", "country_id", "zipcode", "phone", "active", "country", ""]
    @stock_location_id = 0              
    @stock_item = ["id","count_on_hand","backorderable","stock_location_id","variant_id","variant"]
    @stock_item_id = 0
    @stock_movement = ["id","quantity","stock_item_id","stock_item"]
    @stock_movement_id = 0
    @checkout = ["id","number","item_total","total","state","adjustment_total","user_id","created_at","updated_at","completed_at","payment_total","shipment_state",    "payment_state","email","special_instructions","bill_address","ship_address","token","line_items","payments","shipments","adjustments","credit_cards"]
    @checout_id = 0
    @zone_id = 0

  end

  def getusertoken
      @usertoken
  end
  def set_checkout_order_id(arg)
      @checkout_id = arg
  end

  def get_checkout_order_id
      @checkout_id
  end

  def settmp0(arg)
       @tmp0 = arg
  end

  def settmp1(arg)
      @tmp1 = arg
  end
  def gettmp0
      @tmp0
  end

  def gettmp1
      @tmp1
  end

  def getvariant_id
      @variant_id
  end

  def setvariant_id(arg)
      @variant_id = arg
  end
  
  def setordernumber(arg)
      @ordernumber = arg
  end

  def getordernumber
      @ordernumber
  end
 
  def setlineitem_id(arg)
     @lineitem_id = arg
  end
 
  def getlineitem_id()
     @lineitem_id 
  end

  def settaxonomy_id(arg)
    @taxonomy_id = arg
  end
  
  def gettaxonomy_id()
    @taxonomy_id
  end

  def settaxon_id(arg)
    @taxon_id = arg
  end

  def gettaxon_id()
    @taxon_id
  end

  def set_stock_location_id(arg)
    @stock_location_id = arg
  end

  def get_stock_location_id()
    @stock_location_id
  end

 def set_stock_item_id(arg)
    @stock_item_id = arg
  end

  def get_stock_item_id()
    @stock_item_id
  end
 
  def set_stock_movement_id(arg)
    @stock_movement_id = arg
  end

  def get_stock_movement_id()
    @stock_movement_id
  end

  def checkout_attributes()
    @checkout
  end

  def set_zone_id(arg)
    @zone_id = arg
  end

  def get_zone_id()
    @zone_id
  end

 DEFAULT_DATA = { 
  'name' => "Lorem%20Ipsum",
  'price' => '100',
  'description' => "lorem%20ipsum%20dolor%20sit%20amet",
  'available_on' => "2013%2F07%2F15",
  'meta_description' => "lorem%20ipsum%20dolor%20sit",
  'meta_keyword' => "lorem",
  'taxon_ids' => '39'
 }

  #Method will not append the
  def getquery(data, first = 0, last = -1)
     query = String.new
     if last < 0
       for i in first..(data.keys.length - 1) do
         query += 'address['+"#{data.keys[i]}"+']'+'='+"#{data.values[i]}"+'&' 
       end
     else
       for i in first..(last - 1) do
         query += 'address['+"#{data.keys[i]}"+']'+'='+"#{data.values[i]}"+'&' 
       end
     end
     query = URI::encode(query)
  end
end