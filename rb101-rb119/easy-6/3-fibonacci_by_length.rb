# Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

# Problem:
# fibonacci sequence index 1 = 1
# index 2 = 1
# index 3 = index 2 + index 1
# index 4 = index 3 + index 2

# ordered numbers so 

# Data Structure
# array

# (INPUT) integer ->
# array 
# (OUTPUT) integer

# Algorithm:

# 1) looping fibonacci seq generation
#   a) check every new fibonacci number length if equal to input integer
#   b) return the index of the array element of new number + 1
  
def find_fibonacci_index_by_length(num_length)
  fibonacci = [1, 1]
  loop do 
    next_num = fibonacci.last + fibonacci[-2]
    fibonacci << next_num
    return fibonacci.index(next_num) + 1 if next_num.digits.length == num_length
  end
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

# this solution takes up a lot of memory because of big array, so ans key solution more
# space efficient.