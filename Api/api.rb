require 'rest-client'

# RestClient.get(url, headers={})
 
# RestClient.post(url, payload, headers={})

response = RestClient.get "https://uat2.servedbystadium.com/api/v1/task/runners/configuration", {content_type: "application/json;charset=utf-8"}

puts response.code == 201
puts response.headers
puts response.body.include?("minimum_android_build_number_supported")