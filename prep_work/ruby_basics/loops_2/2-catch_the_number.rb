# Modify the following code so that the loop stops if number is equal to or between 0 and 10.
# loop do
#   number = rand(100)
#   puts number
# end

loop do
  number = rand(100)
  puts number
  break if number >= 0 && number <= 10
end