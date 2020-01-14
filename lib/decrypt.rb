require './lib/enigma.rb'
require 'date'

  file_to_encrypt = File.open('./lib/message.txt', 'r')
  encrypted_file = File.open('./lib/encrypted.txt', 'w')
  enigma = Enigma.new

  ARGV == ['./lib/message.txt', './lib/encrypted.txt']

  read_file = file_to_encrypt.read
  encrypted_file.write(enigma.encrypt(read_file.gsub("\n","")))

  p "created 'encrypted.txt' with the key #{enigma.key.join} and date #{enigma.date}"
