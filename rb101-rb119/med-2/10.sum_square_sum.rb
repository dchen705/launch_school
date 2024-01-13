~ 12 minutes
even for easy question like this, I could have taken my time a little, also i got a little quiet when
writing out my pseudocode.
# given - Integer, n
# return - integer representing the difference of the sums from 1 to n squared minus the sum of the squared ints from 1 to n

# rule
#   - assume arg is positive integer


# sum_square_difference(3) == 22
# # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150

# data intermed pathway

# sum_square_difference(3) == 22
# 3
# (1..3).reduce(:+) ** 2 -> sum_squared

# sum_of_squares
# (1..3).map(:*2).sum
# # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)

# algo
# - given integer, `n`
# - get range from 1 to integer `n`
# - assign to `sum_squared` - 
#   the sum of the range exponented by 2
# - assign to `sum_of_squares`
#   - tranform the range by expoenating every num by 2
#   - get the sum of tranformed enum

def sum_square_difference(n)
  ((1..n).reduce(:+) ** 2) - ((1..n).map { |x| x ** 2 }).sum
end

p sum_square_difference(3) == 22
# # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150