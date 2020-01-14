require 'date'
require_relative '../lib/shift'

class Enigma < Shift

  def initialize
    super
  end

  def encrypt(message, key = @key, date = offset)
    encrypt_hash(message, key, date)
  end


end
