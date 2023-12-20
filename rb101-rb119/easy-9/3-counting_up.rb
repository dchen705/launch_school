# 5 minutes to solve 
# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]

# Problem

#   Rules/Requirements
#     - assume input is integer greater than 0

# Example
# 5 -> 1, 2, 3, 4, 5
# 3 -> 1, 2, 3
# 1 -> 1
    
# Data Structure
# (input) integer 

# (output) list of integers

# Algorithm
#   - Iterate over range from 1 to integer, concatenate each number to the return Array

#   Lang TOolbox 
#      - #upto, #times

def sequence(int)
  1.upto(int).with_object([]) { |n, arr| arr << n}
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Ans key:
# def sequence(number)
#   (1..number).to_a
# end

# Further Exploration
# Food for thought: what do you think sequence should return if the argument is not greater than 0. For instance, what should you do if the argument is -1? Can you alter your method to handle this case?

# I think if input number is below 0, we should just count up from input.
# nvm above ^
# options if input is < 0 are:
  # count down - starting num that counts down to input num
  # count up to -1
  # count up to 0.
  # count up to 1 <- we'll take this approach

def sequence(num)
  num >= 1 ? (1..num).to_a : (num..1).to_a
end

p sequence(5)
p sequence(1)
p sequence(0)
p sequence(-1)
  