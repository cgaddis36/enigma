class Shift
  attr_reader :char_array

  def initialize
    @char_array = char_array
    @key = []
  end

  def char_array
    char_array = ("a".."z").to_a << " "
  end

  def rand_keys
    @key = Array.new(5){rand(10)}
  end

end
