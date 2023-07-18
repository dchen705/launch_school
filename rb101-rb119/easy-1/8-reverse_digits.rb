# Reverse the Digits in a Number

# Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

# reflex algo:
# look for numeric method that breaks number into array of digits, alternatively
# turn number into string, then break string into arrays.


def reversed_number(num)
  string = num.to_s
  arr = string.split(//)
  arr.reverse!
  reversed = arr.join.to_i
  puts reversed
end

reversed_number(123)

# def reversed_number(number)
#   string = number.to_s
#   reversed_string = string.reverse
#   reversed_string.to_i
# end

# could have just reversed the string instead of converting to array

# aside from converting to string which consisely is

# def reversed_number(num)
#   num.to_s.reverse!.to_i
# end

# someone else used loop in combo with mod 10 (represents last digit)

# loop do
#       reversed += (number % 10)
#       break if number < 10
#       reversed *= 10
#       number /= 10
#   end