require 'page-object'

class StoreCredit
  include PageObject
  include AdminMenu
  include AdminAction
  PageObject.javascript_framework = :jquery

  page_url('http://rnd.domain4now.com/admin/store_credits')

  text_field(:amount,:id => 'debit_credit_amount')
  select_list(:mode, :id => 'store_credit_payment_mode')
  text_field(:reason, :id => 'store_credit_reason')
  button(:submitbtn,:id => 'debit_credit')

  def details(amt, mode, reason)
    self.amount = amt
    self.mode = mode
    self.reason = reason
  end

  def submit
    self.submitbtn
  end
end