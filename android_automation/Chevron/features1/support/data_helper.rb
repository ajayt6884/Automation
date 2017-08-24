module DataHelper
=begin
  DATA = {settings_button_index: {use_my_location_for_promotions: 0, show_me_both_chevron_and_texaco_station_results: 1},
    credit_card_webview_page: {login: "https://chevrontexaco.mycreditcard.mobi/mservice/login.do", apply_today: "https://www.onlinecreditcenter2.com/mapplygen4/load.do"},
    highlighted_icon: {icon_ids: ["station_list_item_pointer_number_primary_blue", "station_list_item_pointer_number_primary_red"]},  
    all_service_icon: {service_icon_ids: ["station_finder_detail_fragment_extra_mile_icon", "station_finder_detail_fragment_diesel_icon", "station_finder_detail_fragment_store_icon", "station_finder_detail_fragment_car_wash_icon", "station_finder_detail_fragment_gift_icon"]},
    station_list_service_icon: {icon_ids: ["station_list_item_wash_icon", "station_list_item_store_icon", "station_list_item_diesel_icon", "station_list_item_extramile_icon"]},
    station_brands: {brands: ["Texaco", "Chevron"]},
    stations_list_attributes: {attr_ids: ["station_list_item_street_address", "station_list_item_city_address", "station_list_item_brand", "station_list_item_distance"]},
    route_planner_images: {from_and_destination_images: ["marker_from.png", "marker_destination.png"]},
    credit_card_buttons: {login: "btn_CreditCard_login.png", apply_today: "btn_CreditCard_apply.png"},
    route_planner_stations_header: {stations: "tab StationsInactive", stations_added: "tab StationsAddedInactive"},
    station_filters:{extramile: "icon filter EM default", diesel: "icon filter Diesel default",store: "icon filter Store default",car_wash: "icon filter CarWash default"},
    home_page_label_index: {stations_near_me: 3, stations_near_address: 4, route_planner: 0, credit_card: 1, promotions: 5, settings: 2}}

  def data_for(key)
  	DATA[key.to_sym]
  end
=end
  def wait_time
    180
  end

=begin
  def promotions_data
    promotions_data = ["Promotions",
                       "Save at the Pump",
                       "Earn points by using your card every time you shop Safeway",
                       "5-Hour Energy Shot",
                       "2 for $4.99",
                       "Muscle Milk",
                       "2 for $6.99",
                       "Hot Food Mix & Match",
                       "2 for $1.99",
                       "Meal Deal",
                       "$1.99",
                       "Conditions apply. Tap each item for details.",
                       "Smart Water",
                       "2 for $2.99",
                       "Snack Deal",
                       "$1.99",
                       "Red Bull, Monster, Rockstar & Xyience",
                       "2 for $3.99",
                       "Featured Promotions",
                       "ExtraMile Promotions"
                     ]

  end
  

=end
end

World(DataHelper)
