# Reflection > High Problem Solving
#   Figured out 2/3 known approaches
#   Algo for approach 1 derived by DS>P(Questioning)>P(Tactical Insight)>A
#     minimal rules and requirements
#     Clearing_hurdle: figuring out meaning of 'leading subsequence' and finding iterative association
#     between size of input and number of subsequences
#     for approach 2: insight was -> more mathy -> seeing occurence of first num was input_arr size (n) times and
      # next num was n-1 times, etc...
#     Missed: finding accumulative association between subsequence''s sum with the next subsequence sum
  
# Reflection > Low Implementation
#   Stumbling_block: each_with_object not 'accumulating' value of obj with each iteration and seeeming
#   to return the original argument value despite reassigment within block
#     Clarified 3 differences between each_with_object and reduce
#       1) return values
#       2) parameter order
#       3) parameter `obj` target
#   Showed that #reduce(:+) works like #sum

# Alternative DS:
# A lot of students instead of accumultating a value, concatenated subsequence into an array then summed the array.
  
# Reflection > Communication

# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.
# # ========================
# Problem
#   Question
#     - what is a "leading subsequence"?
#       example: ([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2)
#   Restated
#     - prompt self explanatory
#   Rules and Requirements
#     - input array has at least 1 number
#     - (implicit) numbers can be non-integers?

#   Tactical Insight
#     - number of subsquences is equal to number of numbers in input array
#     - each subsequence starts first element from index 0 up to index n
#     index n can be treated as an incrementally increasing +1 for each subsequence iteration

#   Tactical Insight 2:
#     - sum_of_sums([3, 5, 2]) is just (3 * n) + (5 * (n-1)) + (2 * (n-2)) etc...

# Examples

#   sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
#   sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
#   sum_of_sums([4]) == 4
#   sum_of_sums([1, 2, 3, 4, 5]) == 35

# Data Structure
# (input) arr of numbers ->
# arr -> number...arrr -> num... arrr -> num...etc...
# (output) number

# Algorithm

#   Approach 1: Dumb programming way
#     For length of input array
#       Iteratively generate subsequences
#       get the sub-sums from the subsequences
#       Store a running total and add the sub-sums to the running total which becomes the output
      

#   Approach 2: Math way
#     Initialize a counter var and assign to length of input arr
#     Iterate through each element in input array
#       multiply element by counter - assign to `some_var`
#       decrement counter by 1
#       store and add `some_var` to `running_total`

# ========================
require 'pry'
#Approach 1:
# def sum_of_sums(num_arr)
#   running_sum = 0
#   num_arr.size.times do |idx|
#     subsequence = num_arr[0..idx]
#     subsum = subsequence.sum
#     running_sum += subsum
#   end
#   running_sum
# end

# Failed Approach 2
# def sum_of_sums(num_arr)
#   counter = num_arr.size
#   running_total = 0
  # num_arr.each_with_object(0) do |num, running_total|
  #   subtotal = num * counter
  #   counter -= 1
  #   running_total += subtotal
  # end
#   num_arr.each do |num|
#     subtotal = num * counter
#     counter -= 1
#     running_total += subtotal
#   end
#   running_total
# end

#Approach 2
# def sum_of_sums(num_arr)
#   count = num_arr.size
#   num_arr.reduce(0) do |running_total, num|
#     subtotal = num * counter
#     counter -= 1
#     running_total += subtotal
#   end
# end
# Refactored:
# def sum_of_sums(num_arr)
#   num_arr.reduce(0).with_index do |(running_total, num), idx|
#     num_count_in_running_total = num_arr.size - idx
#     running_total += (num * num_count_in_running_total)
#   end
# end
# ^ note the order of chaining matters, need to put reduce as last method so final return value
# derives from reduce.

# def sum_of_sums(num_arr)
#   num_arr.each_with_index.reduce(0) do |running_total, (num, idx)|
#     num_count_in_running_total = num_arr.size - idx
#     running_total += (num * num_count_in_running_total)
#   end
# end

# def sum_of_sums(num_arr)
#   num_arr.each_with_index.reduce(0) do |running_total, (num, idx)|
#     running_total += (num * (num_arr.size - idx))
#   end
# end


# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Both solutions workeds.
# trip-ups:
# reduce parameter order is |running_total, element|

# def sum_of_sums(num_arr)
#   counter = num_arr.size
#   num_arr.each_with_object(0) do |num, running_total|
#     subtotal = num * counter
#     counter -= 1
#     running_total += subtotal
#   end
# end

# ^
# My intention was to have `running_total` store and summate the `subtotal` of each iteration and then return it. But the method `sum_of_sums` seems to return 0. Is it simply returning the initial value assigned to the object? Does the reassigned value of the `running_total` not get passed down to subsequent iterations?

#Chatgpt solution:
# def sum_of_sums(num_arr)
#   num_arr.each_with_object([]).with_index(1) do |(num, running_totals), index|
#     subtotal = num * index
#     running_totals << subtotal
#   end.sum
# end
# apparently, I can't accumulate values using 0 as the initial value of each_with_object
# I wonder if this has to do with the design of the #each_with_object method - it probably
# returns the initial object which is 0.
# The reason an array as an initial object accumulates, unlike 0 which is an immutable object,
# an empty array can be modified

# [1,2,3].each_with_object('s') {|n, obj| obj = n.to_s } => 's'
# [1,2,3].reduce('s') {|obj, n| obj = n.to_s } => '3'

# interestingly, #reduce works fine as my intentions.
# I guess the fundamental difference between the return value of each_with_object and reduce seems
# to be that each_with_object always returns the object passed as argument, and the associated parameter-designated
# block variable is not return
# whereas reduce returns the parameter designated block variable initially assigned to the argument object.
# thus effectively, if you reassign the block variable associated with the object in each_with_object, 
# the return value isn't affected.

# ==============================
# Checked Ans key:
# rewrite your solution using .reduce(:+) which works like #sum
# def sum_of_sums(num_arr)
#   running_sum = 0
#   num_arr.size.times do |idx|
#     running_sum += num_arr[0..idx].reduce(:+)
#   end
#   running_sum
# end

# Here's a third approach for algorithm:
# Initialize the `accumulator` var to 0 
# Initialize `sum_total` var to 0
# For each `num` in input array
#   `accumulator `reassign to itself + the current element being iterated over
#   (effectively 'tracking' the accumulating sum of each subsequent subsequence)
#   reassign `sum_total` to its value + `accumulator
# return sum_total

# def sum_of_sums(num_arr)
#   accumulator = 0
#   sum_total = 0
#   num_arr.each do |num|
#     accumulator += num
#     sum_total += accumulator
#   end
#   sum_total
# end

# p ([1,2,3].reduce(0) do |running_total, n|
#   running_total += n
#   puts running_total
# end) # -> raises an error: undefined + method for nil class

# on 1st iteration, puts call returns nil, `running_total` on 2nd iteration is assigned to nil which is why #+ method cannot be invoked.
# What running_total is assigned to the previous block’s return value. Meaning every block iteration creates it’s own `running_total` var; blocks are not sharing the same `running_total` var.
# Meanwhile, #each_with_object’s `obj’ var is not shared either between block iterations, rather a new one created for each iteration and assigned to the initial argument object.

# Attempted SOLUTION USING DIFF DATA STRUCTURE:
# ^ Array#<< doesn't work like expected
def sum_of_sums(num_arr)
  num_arr_cp = num_arr.dup
  sub_arrays = []
  until num_arr_cp.size <= 0
    sub_arrays << num_arr_cp
    # binding.pry sub_arrays => [3, 5, 2] then [[3, 5], [3, 5]
    num_arr_cp.pop
  end 
  sub_arrays.flatten.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35