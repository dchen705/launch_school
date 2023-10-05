# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.
# ==============================
# PROBLEM

#   - given array of integers, multiply all integers once with each other, divide the multiplicative total by size of array and round by 3 decimals
  
#   - Clarification:
#     - assume array is non-empty

# DATA STRUCTURE
#   (INPUT) array of integers ->
#   integer ->
#   float ->
#   string (OUTPUT) <- for formatting

# ALGORITHM

# - iterative over array of integers, multiplying current int to running total
# - divide the running total by size of array (float division), assign to `mult_avg`
# - round by 3 decimals the `mult_avg` float and return
  # - requires formatting for trailing 0s

# ==============================
def show_multiplicative_average(int_arr)
  mult_avg = int_arr.reduce(1) do |total, int|
    total * int
  end
  
  mult_avg /= (int_arr.size).to_f
  sprintf("%.3f", mult_avg.round(3))
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667


# ==============================



# ==============================



# ==============================