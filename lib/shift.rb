class Shift
  attr_reader :enigma_alphabet, :date, :key

  def initialize
    @enigma_alphabet = ("a".."z").to_a << " "
    @date = DateTime.now.strftime('%d%m%y')
    @key = key
  end

  def key
    Array.new(5){rand(10)}
  end

  def inner_number_keys_array(key = @key)
    inner_number_keys_array = []
    if !key.is_a? Array
      key = key.to_s.split(//).map do |key|
        key.to_i
      end
    end
      key.each_cons(2) do |inner_numbers|
      inner_number_keys_array << inner_numbers.join
    end
    inner_number_keys_array = inner_number_keys_array.flatten
  end

  def encryption_hash(key = @key, date = @date)
    keys_hash = inner_number_keys_array(key).each_with_index.reduce({}) do |acc, (number, index)|
      acc[(65 + index).chr] = number.to_i + (date.to_i ** 2).to_s.split(//)[-4..-1][index].to_i
      acc
    end
    keys_hash
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
        if !@enigma_alphabet.include?(letter)
          new_message << letter
        elsif index % 4 == 0
          a = @enigma_alphabet.rotate(encryption_hash(key, date)["A"])
          new_message << a[(@enigma_alphabet.index(letter))]
        elsif index % 4 == 1
          b = @enigma_alphabet.rotate(encryption_hash(key, date)["B"])
          new_message << b[(@enigma_alphabet.index(letter))]
        elsif index % 4 == 2
          c = @enigma_alphabet.rotate(encryption_hash(key, date)["C"])
          new_message << c[(@enigma_alphabet.index(letter))]
        elsif index % 4 == 3
          d = @enigma_alphabet.rotate(encryption_hash(key, date)["D"])
          new_message << d[(@enigma_alphabet.index(letter))]
        end
      end
    end
    new_message.join
  end

  def decrypted_message(message, key = @key, date = @date)
    decryption_message = []
    split_message(message).each do |inner_array|
      inner_array.map.with_index do |letter, index|
        if !@enigma_alphabet.include?(letter)
          decryption_message << letter
        elsif index % 4 == 0
          a_shifted_chars = enigma_alphabet.rotate(encryption_hash(key, date)["A"])
          decryption_message << @enigma_alphabet[a_shifted_chars.index(letter)]
        elsif index % 4 == 1
          b_shifted_chars = enigma_alphabet.rotate(encryption_hash(key, date)["B"])
          decryption_message << @enigma_alphabet[b_shifted_chars.index(letter)]
        elsif index % 4 == 2
          c_shifted_chars = enigma_alphabet.rotate(encryption_hash(key, date)["C"])
          decryption_message << @enigma_alphabet[c_shifted_chars.index(letter)]
        elsif index % 4 == 3
          d_shifted_chars = enigma_alphabet.rotate(encryption_hash(key, date)["D"])
          decryption_message << @enigma_alphabet[d_shifted_chars.index(letter)]
        end
      end
    end
    decryption_message.join
  end

  def encrypt_hash(message, key = @key, date = @date)
    if !key.is_a? String
       key = key.join
    end
    {encryption: encrypted_message(message, key, date), key: key, date: date}
  end

  def decrypt_hash(message, key = @key, date = @date)
    if !key.is_a? String
       key = key.join
    end
    {decryption: decrypted_message(message, key, date), key: key, date: date}
  end

end
