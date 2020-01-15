require './lib/enigma.rb'
require 'date'

  file_to_encrypt = File.open(ARGV[0], 'r')
  encrypted_file = File.open(ARGV[1], 'w')
  read_encrypted_file = File.open(ARGV[1], 'r')
  enigma = Enigma.new

  read_file = file_to_encrypt.read

  encrypted_hash = enigma.encrypt(read_file.gsub("\n",""))


  encrypted_file.write(encrypted_hash[:encryption])
  encrypted_file.close

  read_file = read_encrypted_file.read

  p "created 'encrypted.txt' with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"
