#!/usr/bin/env ruby
require 'optparse'

TASKS_FILE = 'tasks.txt'
options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on('-a', '--add TASK', 'Add a new task') { |task| options[:add] = task }
  opts.on('-l', '--list', 'List all tasks') { options[:list] = true }
  opts.on('-r', '--remove INDEX', Integer, 'Remove a task by index') { |i| options[:remove] = i }
  opts.on('-h', '--help', 'Show help') { puts opts; exit }
end.parse!

File.write(TASKS_FILE, "") unless File.exist?(TASKS_FILE)
tasks = File.readlines(TASKS_FILE, chomp: true)

if options[:add]
  tasks << options[:add]
  File.write(TASKS_FILE, tasks.join("\n") + "\n")
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  puts "Tasks:"
  puts                 # пустая строка после заголовка
  tasks.each { |task| puts "    #{task}" }  # 4 пробела

elsif options[:remove]
  index = options[:remove] - 1
  if index >= 0 && index < tasks.length
    removed = tasks.delete_at(index)
    File.write(TASKS_FILE, tasks.join("\n") + (tasks.empty? ? "" : "\n"))
    puts "Task '#{removed}' removed."
  end
end
