require 'net/http'
require 'json'
require 'uri'

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  status_message = "#{response.code} #{response.message}"
  body = JSON.pretty_generate(JSON.parse(response.body))

  puts "Response status: #{status_message}"
  puts "Response body:"
  puts body
end
