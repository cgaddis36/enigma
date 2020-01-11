class Shift

  def char_array
    char_array = ("a".."z").to_a << " "
  end

  def rand_keys
    Array.new(5){rand(10)}
  end

  def inner_number_array
    inner_number_array = []
    rand_keys.each_cons(2) do |inner_numbers|
      inner_number_array << inner_numbers.join
    end
    inner_number_array = inner_number_array.flatten
  end

  def offset_date_array
    (DateTime.now.strftime('%d%m%y').to_i ** 2).to_s[-4..-1].split(//)
  end

  def keys_hash
    inner_number_array.each_with_index.reduce({}) do |keys_hash, (number, index)|
      keys_hash[(65 + index).chr] = number.to_i + offset_date_array[index].to_i
      keys_hash
    end
  end
end
