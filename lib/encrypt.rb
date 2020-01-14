require './lib/shift.rb'
require 'date'

  file_to_encrypt = File.open('./lib/message.txt', 'r')
  encrypted_file = File.open('./lib/encrypted.txt', 'w')
  shift = Shift.new

  read_file = file_to_encrypt.read
  encrypted_file.write(shift.encrypt_hash(read_file.gsub("\n","")))

  p "created 'encrypted.txt' with the key #{shift.key.join} and date #{shift.date}"
