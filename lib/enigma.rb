require 'date'
require_relative '../lib/shift'

class Enigma < Shift

  def encrypt(message, key = @key, date = @date)
    encrypt_hash(message, key, date)
  end

  def decrypt(message, key = @key, date = @date)
    decrypt_hash(message, key, date)
  end

end
