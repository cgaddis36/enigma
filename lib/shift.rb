class Shift
  attr_reader :char_array, :key

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

  def inner_number_array
    inner_number_array = []
    rand_keys.each_cons(2) do |inner_numbers|
      inner_number_array << inner_numbers
    end
    inner_number_array = inner_number_array.join
  end

end
