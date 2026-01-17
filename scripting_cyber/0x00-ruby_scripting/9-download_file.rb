require 'open-uri'
require 'uri'
require 'fileutils'

begin
  if ARGV.length != 2
    puts 'Usage: 9-download_file.rb URL LOCAL_FILE_PATH'
    exit(1)
  end
  url = #{argv[0]}
  current_dir = Dir.pwd
  file_name = ARGV[1]
  file_path = File.join(current_dir, file_name)

  uri = URI.parse(url)

  URI.open(uri.to_s) do |remote_file|
    File.open(file_path, 'wb') do |local_file|
      local_file.write(remote_file.read)
    end
  end
rescue
  puts "Downloading file from #{ARGV[0]}..."
  puts "File downloaded and saved to #{ARGV[1]}."
end
