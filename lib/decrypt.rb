require './lib/enigma.rb'
require 'date'

  file_to_decrypt = File.open(ARGV[0], 'r')
  decrypted_file = File.open(ARGV[1], 'w')
  enigma = Enigma.new


  read_file = file_to_decrypt.read
  decrypted_file.write(enigma.decrypt(read_file.gsub("\"","")[14..24], read_file.gsub("\"","")[33..37], read_file.gsub("\"","")[-7..-2]))
  decrypted_file.close

  p "created 'decrypted.txt' with the key #{ARGV[2]} and date #{ARGV[3]}"
