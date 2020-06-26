singers = ["justin", "selena", "demi", "carly"]

capitalized_singers = []

reversed_singers = []

name_length = []

singers.each do |singer|
  capitalized_singers << singer.capitalize
end

singers.reverse_each do |singer|
  reversed_singers << singer
end

singers.each do |singer|
  if singer.length > 4
  name_length << singer
  end
end

puts name_length
puts capitalized_singers
puts reversed_singers
