require './lib/enigma.rb'
require 'date'

  file_to_decrypt = File.open(ARGV[0], 'r')
  decrypted_file = File.open(ARGV[1], 'w')
  enigma = Enigma.new


  read_file = file_to_decrypt.read
  decrypted = enigma.decrypt(read_file, ARGV[2], ARGV[3])

  decrypted_file.write(decrypted[:decryption])

  p "created 'decrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"
