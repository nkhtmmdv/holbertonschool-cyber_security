#!/usr/bin/env ruby
# Performs an HTTP POST request and prints status and body

require 'net/http'
require 'uri'
require 'json'

def post_request(url, body_params = {})
  uri = URI(url)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == 'https')

  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
  request.body = body_params.to_json

  response = http.request(request)

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
