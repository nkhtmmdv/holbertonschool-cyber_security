#!/usr/bin/env ruby
# Prime number checker using Ruby Prime class

require 'prime'

def prime(number)
  return false if number < 2

  Prime.prime?(number)
end
