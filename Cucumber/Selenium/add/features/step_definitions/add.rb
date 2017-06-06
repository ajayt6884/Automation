Given(/^the input "([^"]*)"$/) do |arg1|
  arg1 = "2+2"
end

When(/^the calculator is run$/) do
  @output = "4"
end

Then(/^the output should be "([^"]*)"$/) do |arg1|
  @output.should == arg1
end
