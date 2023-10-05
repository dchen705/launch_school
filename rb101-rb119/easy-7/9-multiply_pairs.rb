# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

# # You may assume that neither argument is an empty Array.

# ========================================
# Problem
# - given 2 input arrays of numbers


# - Test Case
#  - multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# - Clarification
#   - numbers - integers (floats too?)
#   - assume neither input arrays are empty
#   - input arrays can differ in length
#   - duplicates are kept
#   - return array is sorted ascending


# Data Structure

# (input) 2 arrays of numbers ->
# (ouput) new array of numbers

# Algorithm
# - Prelim Thoughts
#   - probably need iterate through input collection
#   - possibly need to initialize new array to concatenate
#   - sort the last step

# - Approach 1: new array initialize then concatenate per iteration

# - Approach 2: return new array with all pairs then transform pair elements into product of pairs elements, then sort
#   - seems most concise?

# - Approach 3: 


# Approach 2 Expanded
#  - works...



# ========================================
# def multiply_all_pairs(arr1, arr2)
#   all_pairs = arr1.product(arr2)
#   all_pairs.map { |x, y| x * y}.sort
# end

# def multiply_all_pairs(arr1, arr2)
#   pair_products = []
#   arr1.each do |x|
#     arr2.each do |y|
#       pair_products << x * y
#     end
#   end
#   pair_products.sort
# end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


# ========================================

# Ans key matched my thinking.

# Other student
# #each_with_object - good method to use for approach 1.


# ========================================
