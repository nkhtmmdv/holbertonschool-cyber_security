#!/usr/bin/env ruby
# Caesar Cipher implementation using classes

class CaesarCipher
  def initialize(shift)
    @shift = shift % 26
  end

  def encrypt(message)
    cipher(message, @shift)
  end

  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  # Internal method for encryption/decryption
  def cipher(message, shift)
    message.chars.map do |char|
      if char >= 'a' && char <= 'z'
        (((char.ord - 'a'.ord + shift) % 26) + 'a'.ord).chr
      elsif char >= 'A' && char <= 'Z'
        (((char.ord - 'A'.ord + shift) % 26) + 'A'.ord).chr
      else
        char
      end
    end.join
  end
end
