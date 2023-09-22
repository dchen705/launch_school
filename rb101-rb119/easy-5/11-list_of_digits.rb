# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.


# def digit_list(digits)
#   digits.to_s.chars.map(&:to_i)
# end

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# now do the mathematically operative/programmatic way.

# initialize `int_arr` var to store ints
# while digits > 0
#   `int_arr`.shift(digits % 10)
#   digits /= 10


def digit_list(digits)
  int_arr = []
  while digits > 0
    int_arr.unshift(digits % 10)
    digits /= 10
  end
  int_arr
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true