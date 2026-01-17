#!/usr/bin/env ruby
# Dictionary attack to crack a SHA-256 hashed password

require 'digest'

if ARGV.length != 2
  puts "Usage: 10-passwordcracked.rb HASHEDPASSWORD DICTIONARY_FILE"
  exit 1
end

hashed_password, dictionary_file = ARGV

found = false

begin
  File.foreach(dictionary_file) do |word|
    word = word.strip
    next if word.empty?

    hash = Digest::SHA256.hexdigest(word)

    if hash == hashed_password
      puts "Password found: #{word}"
      found = true
      break
    end
  end

  puts "Password not found in dictionary." unless found
rescue Errno::ENOENT
  puts "Dictionary file not found."
  exit 1
end

