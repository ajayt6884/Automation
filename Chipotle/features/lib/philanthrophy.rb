class PhilanthrophyForm < SitePrism::Page

  element :checkbox, "#panel-philanthropy > div > div > div > form > div.form__body.cf > div:nth-child(1) > div > div.step__body > div > div > div.grid > div > label"
  element :continue_button, "#panel-philanthropy > div > div > div > form > div.form__body.cf > div:nth-child(1) > div > div.form__group.grid-cell.grid-size-threeForth.u-alignRight > div > a"
  element :confirmation_text, "#panel-philanthropy > div > div > div > form > div.form__body.cf > div:nth-child(2) > div > header > h5"
  element :country, "#country-75 > option:nth-child(1)"
  element :state, "#state-75 > option:nth-child(3)"#state-75 > option:nth-child(3)
  element :city, "#city-75 > option:nth-child(2)"#city-75 > option:nth-child(2)
  element :restaurant, "#restaurant-75 > option:nth-child(1)"#restaurant-75 > option:nth-child(1)
  element :first_name, "#text_field-5574"
  element :last_name, "#text_field-5575"
  element :organization_name, "#text_field-5576"
  element :organization_type, "#selectbox-5577 > option:nth-child(2)"
  element :donation_type, "#selectbox-5578 > option:nth-child(1)"
  element :email, "#text_field-5579"
  element :phone_number, "#text_field-5580"
  element :address, "#text_field-5582"
  element :city_text, "#text_field-5584"
  element :postal_code, "#text_field-5586"
  element :date, "#date_field-5587"
  element :message, "#text_area-5588"
  element :submit, "#panel-philanthropy > div > div > div > form > div.form__submit.grid-cell.grid-size-threeForth.u-textCenter.u-textLeft--sm.u-alignRight--sm > button"
  element :confirmation_message, "#main > div > div.container.container--small.type--brown > div > div > h3"

  def identification_info(first_name, last_name, organization_name)
    self.first_name.set "#{ first_name }"
    self.last_name.set "#{ last_name }"
    self.organization_name.set "#{ organization_name }"
  end

  def contact_info(email, phone_number)
    self.email.set "#{ email }"
    self.phone_number.set "#{ phone_number }"  
  end

  def address_info(address, city_text, postal_code)
    self.address.set "#{ address }"
    self.city_text.set "#{ city_text }"
    self.postal_code.set "#{ postal_code }"
  end

  def date_info(date)
    self.date.set "#{ date }"
  end

  def message_info(message)
    self.message.set "#{ message }"
  end

end
