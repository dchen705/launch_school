23:47 for both questions
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# given - list of integers
# return - list of integers of same length, where the same index element of both input array and return array have the following relationship:
#   - return_array element has to be a number representing the number of other unique numbers in the input array that are less than the current number of the input array.

# Examples:



# The tests above should print "true".

# DS intermed pathway

# [8,1,2,2,3] -> #map to transform

# [8, 1, 2, 3] array#uniq
# array#count block -> 

# [3, 0, 1, 1, 2]

# algo
#   - given `num_list`
#   - iteratively transform each `num` in `num_list` by:
#     return value of the `count`() of `uniq_num` in `uniq_num_list` that are less than `num`
    
def smaller_numbers_than_current(num_list)
  num_list.map do |num|
    num_list.uniq.count { |uniq_num| uniq_num < num}
  end
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# given - a list of numbers
# return - the minimum of all sums of any possible 5 consequetive numbers in given Array

# rules/requirements
#   - if not possible for 5 cons numbers, then return nil


# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

# DS intermed pathway

# [1, 2, 3, 4, 5, 6] ->
# each_cons(5)

# [1, 2, 3, 4, 5], [2, 3, 4, 5, 6]
# .reduce(:+) or .sum

# [ [1, 2, 3, 4, 5], [2, 3, 4, 5, 6] ]
# [].min

# algo
# - given `num_list`
# - enumerate `num_list` into all possible 5 concsequtive numbers (using #each_cons(5)) - being in form of a set of arrays of 5 numbers
# - ^ chain transformation call - transforming each array of 5 consecutive numbers into 1 integer that is the sum of the 5 numbers of that array.
# - find the minimium value of that transformed array.


def minimum_sum(num_list)
  num_list.each_cons(5).map { |five_consq| five_consq.reduce(:+)}.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10