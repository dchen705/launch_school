# 19 minutes
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.


# Observations
#   - n indicates number of rows and number of stars for the center row
#   - first and last row is always 1 star in length


# High Level Options
#   - use an array of empty spaces and stars, loop through a counter that changes the array and prints it as a string for each iteration
#   - iterate by length starting at 1 to n then back to 1, print out length of stars centered as a string

# Lang toolbox
#   String#center


# Data Structures
#   " "

#   diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# (1..n).step

# Step from length 1 to n by 2, for each step, `length`
#   print - "*" * length centered by n 

# Step from length (n - 2) to 1 by 2, for each step, `'elgnth`
#   print - "*" * length centered by n 

def diamond(n)
  (1..n).step(2) { |length| puts ("*" * length).center(n)}

  last_length = n
  while last_length > 1
    last_length -= 2
    puts ("*" * last_length).center(n)
  end
end

diamond(1)