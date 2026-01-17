#!/usr/bin/env ruby
# Downloads a file from a given URL and saves it locally

require 'open-uri'
require 'uri'
require 'fileutils'

if ARGV.length != 2
  puts "Usage: 9-download_file.rb URL LOCALFILE_PATH"
  exit 1
end

url, local_path = ARGV

begin
  uri = URI.parse(url)

  puts "Downloading file from #{url}…"
  
  # Ensure the directory exists
  FileUtils.mkdir_p(File.dirname(local_path))
  
  # Open the URL and write to local file
  URI.open(uri) do |remote_file|
    File.open(local_path, 'wb') do |file|
      file.write(remote_file.read)
    end
  end

  puts "File downloaded and saved to #{local_path}."
rescue StandardError => e
  puts "Failed to download file: #{e.message}"
  exit 1
end
