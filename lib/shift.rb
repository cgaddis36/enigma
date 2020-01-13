class Shift
  attr_reader :char_array, :date, :key

  def initialize
    @char_array = ("a".."z").to_a << " "
    @date = DateTime.now.strftime('%d%m%y')
    @key = key
  end

  def key
    Array.new(5){rand(10)}
  end

  # e(date = @date)
  #   (date.to_i ** 2).to_s[-4..-1].split(//)
  # end

  def inner_number_array(key = @key)
    inner_number_array = []
    if !key.is_a? Array
      key = key.to_s.split(//).map do |key|
        key.to_i
      end
    end
      key.each_cons(2) do |inner_numbers|
      inner_number_array << inner_numbers.join
    end
    inner_number_array = inner_number_array.flatten
  end

  def encryption_hash(key = @key, date = @date)
    x = inner_number_array(key).each_with_index.reduce({}) do |keys_hash, (number, index)|
        keys_hash[(65 + index).chr] = number.to_i + (date.to_i ** 2).to_s.split(//)[-4..-1][index].to_i
      keys_hash
    end
    x
  end

  def split_message(message)
    split_message = []
    (message.downcase.scan /.{1,4}/).each do |string|
      split_message << string.split(//)
    end
    split_message
  end

  def encrypted_message(message, key = @key, date = @date)
    new_message = []
    split_message(message).each do |inner_array|
      inner_array.map.with_index do |letter, index|
        if !@char_array.include?(letter)
          new_message << letter
        elsif index % 4 == 0
          a = @char_array.rotate(encryption_hash(key, date)["A"])
          new_message << a[(@char_array.index(letter))]
        elsif index % 4 == 1
          b = @char_array.rotate(encryption_hash(key, date)["B"])
          new_message << b[(@char_array.index(letter))]
        elsif index % 4 == 2
          c = @char_array.rotate(encryption_hash(key, date)["C"])
          new_message << c[(@char_array.index(letter))]
        elsif index % 4 == 3
          d = @char_array.rotate(encryption_hash(key, date)["D"])
          new_message << d[(@char_array.index(letter))]
        end
      end
    end
    new_message.join
  end

  def encrypt(message, key = @key, date = @date)
    {encryption: encrypted_message(message, key, date), key: key, date: date}
  end

  def decrypt(message, key = @key, date = @date)
    {decryption: decrypted_message(message, key, date), key: key, date: date}
  end

  def decrypted_message(message, key = @key, date = @date)
    decryption_message = []
    split_message(message).each do |inner_array|
      inner_array.map.with_index do |letter, index|
        if !@char_array.include?(letter)
          decryption_message << letter
        elsif index % 4 == 0
          a_shifted_chars = char_array.rotate(encryption_hash(key, date)["A"])
          decryption_message << @char_array[a_shifted_chars.index(letter)]
        elsif index % 4 == 1
          b_shifted_chars = char_array.rotate(encryption_hash(key, date)["B"])
          decryption_message << @char_array[b_shifted_chars.index(letter)]
        elsif index % 4 == 2
          c_shifted_chars = char_array.rotate(encryption_hash(key, date)["C"])
          decryption_message << @char_array[c_shifted_chars.index(letter)]
        elsif index % 4 == 3
          d_shifted_chars = char_array.rotate(encryption_hash(key, date)["D"])
          decryption_message << @char_array[d_shifted_chars.index(letter)]
        end
      end
    end
    decryption_message.join
  end

end
