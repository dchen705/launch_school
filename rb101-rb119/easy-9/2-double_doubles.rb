# (edit)
# how do with_index and with_object differ in return value

# Fairly smooth up until having to write the double_num? helper method = then I wrote
# pretty sloppy solution - brain just didn't wanna work.
# should have said, I'll go back and refactor it if there's time.
# also talking wasn't consistent.

# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

# twice(37) == 74
# twice(44) == 44
# twice(334433) == 668866
# twice(444) == 888
# twice(107) == 214
# twice(103103) == 103103
# twice(3333) == 3333
# twice(7676) == 7676
# twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# twice(5) == 10
# Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

# Problem
#   Restated
#     A double number is even, first half of digits is equal to its second half of digits

# Example
#   - double num can''t be odd in length

# Data Structure


# Algorithm
#   High-Level Approach
#   - check if input num is a double number
#     - if yes, return the input num
#     - else, return input_num * 2

#   Helper `double_num?`
#     High-Level Options
#     - split the double_num into a dividend and remainder (numerical)
#     - convert to string, get the 2 half slices using the (string.length / 2 - 1), check if slices are equal, 

def twice(num)
  double_num?(num) ? num : num * 2
end

def double_num?(num)
  num_str = num.to_s
  lt_midpoint = num_str.size / 2 - 1
  return false if num_str.size.odd?
  if num_str[0..lt_midpoint] != num_str[lt_midpoint+1..num_str.size-1]
    return false
  end
  true
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# 2nd Pass through
# High Abstract Options
  # Convert to digits string or array (I prefer array) and get 2 half slices by index and compare
  # Use divmod using 10 ^ n relationship to split digits in two and compare by numbers
  # Iterate by quantity (num of digits / 2)...2 pointers compare - incremntal+1 indexing
  
def twice(num)
  double_num?(num) ? num : num * 2
end

# approach 1
# convert to string/array
# check that right and left half slices equal

# def double_num?(num)
#   return false if num < 10 || num.digits.size.odd?

#   digits = num.digits
#   num_length = digits.size
#   if digits[0..(num_length / 2 - 1)] != digits[(num_length / 2..-1)]
#     return false
#   end

#   true
# end

# approach 2
# math division to get dividend and remainder halves
# check if 

# def double_num?(num)
#   return false if num < 10 || num.digits.size.odd?

#   num_length = num.digits.size
#   half1, half2 = num.divmod(10 ** (num_length / 2))
#   half1 == half2
# end

# approach 3
# convert to digits
# iterate from 0 index up to half length of digits
def double_num?(num)
  return false if num < 10 || num.digits.size.odd?

  digits = num.digits
  half_length = digits.size / 2
  (0...half_length).each do |idx|
    if digits[idx] != digits[idx + half_length]
      return false
    end
  end
  
  true
end
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10


# Ans key 
# converted to string

# def twice(number)
#   string_number = number.to_s
#   center = string_number.size / 2
#   left_side = center.zero? ? '' : string_number[0..center - 1]
#   right_side = string_number[center..-1]

#   return number if left_side == right_side
#   return number * 2
# end

# Other Student
# def twice(int)
#   double?(int) ? int : int * 2
# end

# def double?(int)
#   digits = int.digits.reverse

#   first_half, second_half = digits.partition.with_index do |int, index|
#     index < digits.size / 2 
#   end
#   first_half == second_half
# end

# very good use of partition by index
