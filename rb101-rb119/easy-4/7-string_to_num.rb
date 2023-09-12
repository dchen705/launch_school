# Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

# get string of digits

# make 2 arrays w/ matching index to matching string to integer
# iterate: for each character of String
#   for each element of string key 
#     if character equal to string key element 
#       add new element to returned digit Array

# def string_to_integer(string)
#   string_key = %w(0 1 2 3 4 5 6 7 9)
#   integer_key = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
#   char_arr = string.split(//)
#   integer_arr = char_arr.map do |char|
#       matched_digit = 0
#       integer = string_key.each_with_index do |digit, idx|
#         if digit == char
#           matched_digit = integer_key[idx]
#         end
#       end
#       matched_digit
#   end

#   integer = integer_arr.reduce(0) do |total, digit|
#     total * 10 + digit
#   end
# end

# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

# range#each_with_index method exists
# string#chars method exists too.
# refactoring with this knowledge

def string_to_integer(string)
  string_key = '0'..'9'
  integer_key = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  
  integer_arr = string.chars.map do |char|
    matching_idx = 0
    string_key.each_with_index do |digit, idx|
      matching_idx = idx if char == digit
    end
    integer_key[matching_idx]
  end
  
  integer_arr.reduce(0) do |total, digit|
    total * 10 + digit
  end
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570


# In answer key, a hash was used. So I'm wondering if the pattern of using two array keys is signal
# that using hash is appropriate.