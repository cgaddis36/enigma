require 'date'
require_relative '../lib/shift'

class Enigma < Shift

  def initialize(rand_keys, date)
    super(rand_keys, date)
  end

  def encrypt(message, key = @key, date = @date)
  end


end
