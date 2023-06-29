# Write a program that asks the user to enter two integers, then prints the results of dividing the first by the second. 
# The second number must not be 0. Since this is user input, there's a good chance that the user won't enter a valid integer. Therefore, you must validate the input to be sure it is an integer. 

# fails if number can't convert back to string once converted to integer w/o loss of info
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil
denominator = nil
divided_result = nil

loop do
puts ">> Please enter numerator: "
numerator = gets.chomp
if valid_number?(numerator)
  break
end
puts ">> Invalid input. Integers only."
end

loop do
puts ">> Please enter the denominator: "
denominator = gets.chomp
if denominator.to_i == 0
  puts ">> Invalid. Denominator of 0 not allowed."
elsif valid_number?(denominator)
  break
end
puts ">> Invalid input. Integers only."
end

divided_result = numerator.to_i/denominator.to_i

puts "#{numerator} / #{denominator} is #{divided_result}"
