require 'net/http'
require 'json'

def post_request(url, body_params = {})
  # Parse the URL
  uri = URI(url)

  # Create the HTTP POST request
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == 'https') # Use SSL if the URL is HTTPS
  request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })

  # Add the body parameters as JSON
  request.body = body_params.to_json unless body_params.empty?

  # Execute the request
  response = http.request(request)

  # Print the response
  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  puts response.body
end

