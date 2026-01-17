#!/usr/bin/env ruby
# Basic CLI application using OptionParser

require 'optparse'

TASKS_FILE = 'tasks.txt'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on('-a', '--add TASK', 'Add a new task') do |task|
    options[:add] = task
  end

  opts.on('-l', '--list', 'List all tasks') do
    options[:list] = true
  end

  opts.on('-r', '--remove INDEX', Integer, 'Remove a task by index') do |index|
    options[:remove] = index
  end

  opts.on('-h', '--help', 'Show help') do
    puts opts
    exit
  end
end.parse!

# Ensure tasks file exists
File.write(TASKS_FILE, "") unless File.exist?(TASKS_FILE)

tasks = File.readlines(TASKS_FILE, chomp: true)

if options[:add]
  tasks << options[:add]
  File.write(TASKS_FILE, tasks.join("\n") + "\n")
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  puts "Tasks:"
  puts                   # пустая строка
  tasks.each do |task|
    puts "    #{task}"    # 4 пробела
  end

elsif options[:remove]
  index = options[:remove] - 1
  if index >= 0 && index < tasks.length
    removed = tasks.delete_at(index)
    File.write(TASKS_FILE, tasks.join("\n") + (tasks.empty? ? "" : "\n"))
    puts "Task '#{removed}' removed."
  end
end
