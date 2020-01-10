class Shift
  attr_reader :char_array

  def initialize
    @char_array = char_array
  end

  def char_array
    char_array = ("a".."z").to_a << " "
  end


end
