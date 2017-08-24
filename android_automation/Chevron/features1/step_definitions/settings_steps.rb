Then(/^I should see "(.*)" is "(.*)"$/) do |setting_text, status|
  index = data_for("settings_button_index")["#{setting_text.downcase.split.join('_')}".to_sym]
  layout_elem = query("switch index:'#{index}'")
  button_elem = query("* id:'settings_toggle_button' index:#{index}")
  x_cordinate_of_layout = layout_elem.first["rect"]["x"]
  x_cordinate_of_button = button_elem.first["rect"]["x"]
  if status == "disabled"
    expect(x_cordinate_of_button - x_cordinate_of_layout).to be < 10
  else
    expect(x_cordinate_of_button - x_cordinate_of_layout).to be > 10
  end
end

Then(/^I "(.*?)" the "(.*?)"$/) do |action, setting_text|
 wait_for(:timeout => wait_time){element_exists("view marked:'Settings'")}
 touch("switch marked:'Show me both Chevron and Texaco station results'")    
end


Then(/^I should see "(.*?)" in header$/) do|expected_text|
  element_exists("label marked:'#{expected_text}'")
end

Then /^setting should get "(.*?)"$/ do |status|
  if status == "disable"
    expect(query("switch").first['value']).to eq("0")
  elsif status == "enable"
    expect(query("switch").first['value']).to eq("1")
  end
end

And /^default setting is enabled$/ do
  expect(query("switch").first['value']).to eq("1")
end