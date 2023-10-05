# my take: ez, practice multiapproaches, other solutions - same general mech, learn array#zip.

# # Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# # You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# # interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Problem
# ============================================================

# arrays can have diff data types
# output array is ordered by alternating elements of input arrays starting with first array
# input arrays assumed same length

# Data Structure

# (input) 2 arrays of same length
# (output) 1 new array

# Algorithm:

# Approach 1

# Initialize new empty array and assign to `combined_arr` var
# Iterate from 0 to (input array length - 1), name parameter `index`
#   concatenate `arr1`[index] to `combined_arr`
#   concatenate `arr2`[index] to `combined_arr
  
# Critique: Will resulting array share objects with input arrays? I don't think so.
# Array#[] should return a new object. Nope you're confusing with String#[]. 
# So yeah, this approach new array will share object with input array.

# Approach 2:

# Initialize new empty array and assign to `combined_arr` var
# Iterate from 0 to (input array length - 1), name parameter `index`
#   concatenate clone of `arr1`[index] to `combined_arr`
#   concatenate clone of `arr2`[index] to `combined_arr
  
# Approach 3:

# method call to convert each input array's arrays into string then join them
# iterate over 0 to string length - 1
#   etc...
  
# Critique - seems similar just adding extraenous steps of converting between arrays and strings. And
# honestly converting to string doesn't make it easier.

# Going with approach 2:


# def interleave(arr1, arr2)
#   combined_arr = []
#   (arr1.length).times do |index|
#     combined_arr << arr1[index].clone
#     combined_arr << arr2[index].clone
#   end
#   combined_arr
# end

# Approach 4
# pair each alternating element into into a nested array then flatten.

# def interleave(arr1, arr2)
#   combined_arr = []
#   arr1.length.times do |index|
#     combined_arr << [arr1[index], arr2[index]]
#   end
#   combined_arr.flatten!
# end

# will the returned array's elements be shared objects still with input arrays? Yes



# ANS KEY: 
# general mechanism the same.

# def interleave(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << element << array2[index]
#   end
#   result
# end

# OTHER STUDENTS:
# alternative methods:
# # each_with_object

# FURTHER EXPLORATION
# See if you can rewrite interleave to use Array#zip.

# [1] 3.2.2 > [1,2,3].zip('a')
# TypeError: wrong argument type String (must respond to :each)
# from (pry):1:in `zip'
# [2] 3.2.2 > [1,2,3].zip('a','b','c')
# TypeError: wrong argument type String (must respond to :each)
# from (pry):2:in `zip'

# [3] 3.2.2 > [1,2,3].zip('a'..'b')
# [
#     [0] [
#         [0] 1,
#         [1] "a"
#     ],
#     [1] [
#         [0] 2,
#         [1] "b"
#     ],
#     [2] [
#         [0] 3,
#         [1] nil
#     ]
# ]

# ^^ above tests seem to indicate the zip argument is required to be a collection, doesn't need
# to be same size as though as I used a range...
# like the docs say, zip seems to have converted the range to an array
# however, #zip raises error when passed string as argument

# [5] 3.2.2 > [1,2,3].zip('abc')
# TypeError: wrong argument type String (must respond to :each)
# from (pry):5:in `zip'
# [6] 3.2.2 > 

# ^ even here, even though using a 3 char string, which is technically a collection but perhaps
# need a collection that responds to each method.

def interleave(array1, array2)
  array1.zip(array2).flatten!
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']