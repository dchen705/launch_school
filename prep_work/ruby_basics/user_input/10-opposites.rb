# #  Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

# Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

first_input = nil
second_input = nil

loop do
  

loop do
puts ">> Please enter a positive or negative integer: "
first_input = gets.chomp
if valid_number?(first_input)
  break
end 
puts ">> Invalid input. Only non-zero integers are allowed."
end

loop do
puts ">> Please enter a positive or negative integer: "
second_input = gets.chomp
if valid_number?(second_input)
  break
end
puts ">> Invalid input. Only non-zero integers are allowed."
end

first_input = first_input.to_i
second_input = second_input.to_i

if first_input > 0 && second_input < 0
  break
elsif first_input < 0 && second_input > 0
  break
end

puts "Sorry. One integer must be positive; one must be negative."

end

puts "#{first_input} + #{second_input} = #{first_input + second_input}"

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string && number_string.to_i != 0
# end

# def read_number
#   loop do
#     puts '>> Please enter a positive or negative integer:'
#     number = gets.chomp
#     return number.to_i if valid_number?(number)
#     puts '>> Invalid input. Only non-zero integers are allowed.'
#   end
# end

# first_number = nil
# second_number = nil

# loop do
#   first_number = read_number
#   second_number = read_number
#   break if first_number * second_number < 0
#   puts '>> Sorry. One integer must be positive, one must be negative.'
#   puts '>> Please start over.'
# end

# sum = first_number + second_number
# puts "#{first_number} + #{second_number} = #{sum}"

# ^ Their solution
# Line 52: defining a method because checking both inputs is just repeating
# same steps twice...so they define method then call it twice.
# Line 67: multiplying the two numbers to check if negative is good way to
# check if one + and one -
