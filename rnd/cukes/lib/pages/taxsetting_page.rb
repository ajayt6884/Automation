require 'page-object'

class TaxSetting
  include PageObject
  include AdminMenu
  include AdminAction
  PageObject.javascript_framework = :jquery

  page_url('http://rnd.domain4now.com/admin/tax_settings/edit')
  checkbox(:shipment_include_VAT,:xpath => 'html/body/div/div[3]/div/div/div/form/div[2]/input[2]')


  def set_shipment_include_VAT_true
     if self.shipment_include_VAT_checked? == false
       self.check_shipment_include_VAT
       self.update
     end
  end

  def set_shipment_include_VAT_false
    if self.shipment_include_VAT_checked? == true
      self.uncheck_shipment_include_VAT
      self.update
    end
  end

  def shipment_include_VAT_status
    self.shipment_include_VAT_checked?
  end
end