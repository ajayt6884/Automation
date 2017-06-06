class ResturantFeedbackForm < SitePrism::Page

  element :text, "#panel-comments-questions > div > div > div > form > div.form__body.cf > div > div.form__group.talk__comments > label > h6"
  element :country, "#country-74 > option:nth-child(1)" 
  element :state, "#state-74 > option:nth-child(1)" 
  element :city, "#city-74 > option:nth-child(1)" 
  element :restaurant, "#restaurant-74 > option:nth-child(1)"  
  element :date, "#date_field-5559"
  element :hour, :xpath, "//*[@id='subform-271']/div[3]/div/div[1]/div[1]/select/option[6]"
  element :minutes, :xpath, "//*[@id='subform-271']/div[3]/div/div[1]/div[2]/select/option[3]"
  element :meridiemm, :xpath, "//*[@id='subform-271']/div[3]/div/div[1]/div[3]/select/option[2]"
  element :first_name, "#text_field-5561"
  element :last_name, "#text_field-5562"
  element :email, "#text_field-5563"
  element :phone_number, "#text_field-5564"
  element :message, "#text_area-5566"
  element :submit, "#panel-comments-questions > div > div > div > form > div.form__submit.grid-cell.grid-size-threeForth.u-textCenter.u-textLeft--sm.u-alignRight--sm > button"
  element :confirmation_message, "#main > div > div.container.container--small.type--brown > div > div > h3"

  def form_submission_with(first_name, last_name, email, phone_number, message)
    self.first_name.set "#{ first_name }"
    self.last_name.set "#{ last_name }"
    self.email.set "#{ email }"
    self.phone_number.set "#{ phone_number }"
    self.message.set "#{ message }"
  end
end
