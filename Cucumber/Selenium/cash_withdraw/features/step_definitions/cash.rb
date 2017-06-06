class Account
  def deposit(amount)
    @balance = amount
  end
  def balance
    @balance
  end
end

CAPTURE_A_NUMBER = Transform /^\d+$/ do |number|
number.to_i
end

class Teller
  def initialize(cash_slot)
  @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    @cash_slot.dispense(amount)
  end
end

class CashSlot
  def contents
    @contents or raise("I'm empty!")
  end

  def dispense(amount)
    @contents = amount
  end
end

# class Currency::Money
#   def initialize(digits, currency_symbol)
#     @digits = digits
#     @currency_symbol = currency_symbol
#   end
# end

module KnowsTheDomain
  def my_account
    @my_account ||= Account.new
  end

  def cash_slot
    @cash_slot ||= CashSlot.new
  end

  def teller
    @teller ||= Teller.new(cash_slot)
  end
end

World(KnowsTheDomain)

# # encoding: utf-8"
# CAPTURE_CASH_AMOUNT = Transform /^(£|\$|€)(\d+)$/ do | currency_symbol, digits |
# # Obviously we have to create a Currency::Money class to make this work.
# Currency::Money.new(digits, currency_symbol)
# end

Given (/^I have deposited (#{CAPTURE_A_NUMBER}) in my account$/) do |amount|
  my_account = Account.new
  my_account.deposit(amount)
  my_account.balance.should eq(amount),
  "Expected the balance to be #{amount} but it was #{my_account.balance}"
end


When (/^I request (#{CAPTURE_A_NUMBER})$/) do |amount|
  teller = Teller.new(cash_slot)
  teller.withdraw_from(my_account, amount)
end


Then (/^(#{CAPTURE_A_NUMBER}) should be dispensed$/) do |amount|
  cash_slot.contents.should == amount
end


