#!/usr/bin/env ruby
# Performs an HTTP GET request and prints status and body in JSON format

require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI(url)
  response = Net::HTTP.get_response(uri)

  puts "Response status: #{response.code} #{response.message}"
  puts
  puts "Response body:"
  puts

  begin
    json_body = JSON.parse(response.body)
    puts JSON.pretty_generate(json_body)
  rescue JSON::ParserError
    puts response.body
  end
end
