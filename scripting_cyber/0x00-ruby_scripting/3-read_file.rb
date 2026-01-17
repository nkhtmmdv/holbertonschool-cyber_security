#!/usr/bin/env ruby
# Reads a JSON file and counts userId occurrences

require 'json'

def count_user_ids(path)
  file = File.read(path)
  data = JSON.parse(file)

  counts = Hash.new(0)

  data.each do |item|
    counts[item["userId"]] += 1
  end

  counts.sort.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end
