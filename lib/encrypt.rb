require './lib/enigma.rb'
require 'date'

  file_to_encrypt = File.open(ARGV[0], 'r')
  encrypted_file = File.open(ARGV[1], 'w')
  read_encrypted_file = File.open(ARGV[1], 'r')
  enigma = Enigma.new

  read_file = file_to_encrypt.read
  encrypted_file.write(enigma.encrypt(read_file.gsub("\n","")))
  encrypted_file.close

  p "created 'encrypted.txt' with the key #{enigma.key.join} and date #{enigma.date}"
