require 'page-object'

module AdminMenu
 include PageObject
 PageObject.javascript_framework = :jquery
 
 div(:main_menu,:class => 'main-menu-wrapper')

  #Method to click main menu sectionS:
  #ORDERS, PRODUCTS, REPORTS, CONFIGURATION, PROMOTIONS, USERS, PAGES
 def admin_section(section)
   @browser.find_element(:link_text => "#{section}").click
 end

 #Heading on admin sections like
 # Listing Orders, Listing products, Listing Users etc.
 h1(:page_heading,:class =>"page-title")

 #Button NEW button on to create new records like products, users etc.
 button(:newrecord,:class=>"icon-plus")

 #Text on NEW button for e.g. if its in user section then text is "NEW USER",
 # for products text is "NEW PRODUCT"
 element(:button_text,:a,:xpath=>"html/body/div/div[2]/div/div/div/div[2]/ul/li/a")

 #Method to return pageheading
 def page_title
  self.page_heading
 end

 def verifynewrecords
  self.newrecord?
 end

 def create_new_record
  self.newrecord
 end

 def newrecordtext
  self.button_text
 end
end

module AdminAction
  include PageObject
  PageObject.javascript_framework = :jquery

  div(:flash_message,:class => 'flash')
  link(:back_to_listing,:class=>'icon-arrow-left')    #Button to go back to listing page from new/edit form
  button(:update_record,:class=>'icon-refresh') #Update button in admin end
  button(:create_record, :class=>'icon-ok')   #Create button in admin end
  button(:cancel_record,:class=>'icon-remove')  #Cancel button in admin end
  button(:add, :class => 'icon-plus')        #Add button with + icon
  def random_string(var = 7)
    (0...var).map{65.+(rand(25)).chr}.join
  end

  def verify_success_message
    wait_until(3) do
     self.flash_message?
    end
    self.flash_message
  end

  def create
    self.create_record
  end

  def update
    self.update_record
  end

  def back_to_list
    self.back_to_listing
  end

  def add_record
    self.add
  end
end

module ListingAction
  include PageObject
  PageObject.javascript_framework = :jquery

  table(:listing,:class => 'index')
  #link(:edit,:class => 'icon-edit')
  #link(:delete,:class => 'icon-trash')

  def no_of_column
    @browser.find_elements(:tag_name => 'col').length
  end

  def search_record_by_col(name,column)
    a = no_of_column
    puts a
    if the_row = listing_element.find {|row| row[column].text == name}
       puts the_row[a]
       the_row[a-1]
    else
      false
    end

  end

  def search_value_of_column(name, column1, column2)  #name and column1 = to find the row r
                                                      # column2 = value of [r][column2]
    if the_row = listing_element.find {|row| row[column1].text == name}
      the_row[column2].text
    else
      false
    end
  end

  def record_present(name, column)     #name = Value to be searched, column = Name of column where value to be searched
    if the_row = listing_element.find {|row| row[column].text == name}
      true
    else
      false
    end
  end

  def edit_record(name,column)    #Position of edit action is not needed as it is in first position
    search_record_by_col(name,column).link_element.click
  end

  def delete_record(name,column)
    search_record_by_col(name,column).link_element(:index => 1).click  #Position of delete action
  end


end

module CommonMethods
  def random_string(var = 7)
    (0...var).map{65.+(rand(25)).chr}.join
  end


end