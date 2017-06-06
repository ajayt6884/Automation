class GeneralInquiryForm < SitePrism::Page

  element :radio_button, "#panel-comments-questions > div > div > div > form > div.form__body.cf > div > div.form__group.talk__comments > div > div.form__options > div:nth-child(2) > label"
  element :first_name, "#text_field-5567"
  element :last_name, "#text_field-5568"
  element :email, "#text_field-5569"
  element :phone_number, "#text_field-5570"
  element :message, "#text_area-5572"
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
