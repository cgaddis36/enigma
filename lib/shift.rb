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

  def encryption_hash
    inner_number_array.each_with_index.reduce({}) do |keys_hash, (number, index)|
      keys_hash[(65 + index).chr] = number.to_i + offset_date_array[index].to_i
      keys_hash
    end
  end

  def split_message(message)
    split_message = []
    (message.downcase.scan /.{1,4}/).each do |string|
      split_message << string.split(//)
    end
    split_message
  end



  def encrypted_message(message)
    new_message = []
    split_message(message).each do |inner_array|
      inner_array.map.with_index do |letter, index|
        if !char_array.include?(letter)
          new_message << letter
        elsif index % 4 == 0
          a = char_array.rotate(encryption_hash["A"])
          new_message << char_array[a.index(letter)]
        elsif index % 4 == 1
          b = char_array.rotate(encryption_hash["B"])
          new_message << char_array[b.index(letter)]
        elsif index % 4 == 2
          c = char_array.rotate(encryption_hash["C"])
          new_message << char_array[c.index(letter)]
        elsif index % 4 == 3
          d = char_array.rotate(encryption_hash["D"])
          new_message << char_array[d.index(letter)]
        end
      end
    end
    new_message.join
  end

end
