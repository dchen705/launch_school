12:27
Look at the beginning flow of this vid, pretty fluid, I started at the 
Data structure, then went to Problem, then to Examples then to Code then back to Algo then finished Code
Within psueduocode, I described #reduce at a pretty low level, is there a higher
level way to describing #reduce?
If don't give arg for #reduce, then first item value is assigned to the
`accumulator` and iteration starts at the second item

# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

# Don't use the Array#sum method for your solution - see if you can solve this problem using iteration more directly.

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Problem
#   Restated
#     given a list of integers, output the average of all the integers in Array

#   Rules/Requirements
#     - Assume that array is never empty (always size > 0)
#     - All integers inside will be greater than 0
#     - Output is also an Integer
#       If Float value (average) then:
#         Doesn''t round up. Truncate decimal. Integer division!
#     - Don''t use array#sum

# Example

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Data Structure
# (input) array of integers ->

# (output) integer

# Algorithm
#   Approach 1: Iteratively sum up integers then divide by size of the input array
#     # - Initialize `sum`, set to 0
#     # - Iterate over `integer_arr`, set `num` to integer being iterated over
#     #   - Add `num` to average
#     - Set `sum` equal to return value of `#reduce` call on `integer_arr`, within block, set `run_total` = 0, set `num` to current integer being iterated over, return run_total + num
#     - Return `average`

#     Language Toolbox
#       - Use #reduce or #map(:+)


def average(integer_arr)
  sum = integer_arr.reduce(0) do |run_total, num|
    run_total + num
  end

  average = sum / (integer_arr.size)
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


# ====================
# Further Exploration

# Currently, the return value of average is an Integer. When dividing numbers, sometimes the quotient isn't a whole number, therefore, it might make more sense to return a Float. Can you change the return value of average from an Integer to a Float?

# def average(integer_arr)
#   sum = integer_arr.reduce(0) do |run_total, num|
#     run_total + num
#   end

#   average = sum / Float((integer_arr.size))
# end

# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Alternative syntax
# def average(integer_arr)
#   integer_arr.reduce(:+) / integer_arr.size
# end

# Alternative syntax 2
# def average(integer_arr)
#   integer_arr.reduce { |sum, num| sum + num } / integer_arr.size
# end
# ^ If don't give arg for #reduce, then first item value is assigned to the
# `accumulator` and iteration starts at the second item