require 'digest'

if ARGV.length != 2
  puts 'Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE'
  exit(1)
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]
array = File.readlines(dictionary_file)

array.each do |line|
  word = line.chomp!
  hash = Digest::SHA256.hexdigest(word)
  if hashed_password == hash
    puts "Password found: #{word}"
    return
  end
end
puts 'Password not found in dictionary.'
