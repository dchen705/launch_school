# Use next to modify the code so that the loop iterates until either number_a or number_b equals 5. Print "5 was reached!" before breaking out of the loop.
# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)

#   break
# end

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  if number_a == 5 || number_b == 5
    puts "5 was reached"
    break
  else
    puts "number_a is #{number_a}!"
    puts "number_b is #{number_b}!"
    next
  end
end

# Discussion:
# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   next unless number_a == 5 || number_b == 5

#   puts '5 was reached!'
#   break
# end
# their code used an unless loop to keep nexting until conditions
# met. mine was break if true. theirs was next unless true.