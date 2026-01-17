#!/usr/bin/env ruby
# Prints each command-line argument or a message if none provided

def print_arguments
  if ARGV.empty?
    puts "No arguments provided."
  else
    ARGV.each { |arg| puts arg }
  end
end
