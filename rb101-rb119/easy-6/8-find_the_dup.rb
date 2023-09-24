# Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

# Problem:
# Assuming one duplicate value in unsorted array, return the duplicate value (the value that occurs twice)

# Assuming input array contains only integer values, would my algo work for other data types?

# Memory vs Speed

# Data Structures:
# (INPUT) intput_array ->
# (OUTPUT) the dup value

# Algorithm:

# Approach 1: 
# Create empty array and assign to `holding_array` var
# Iterate by element for each element in input array
#   remove current element and concatenate to `holding_array` if `holding_array` doesn't include current element
# Return element of input array at index 0


# Critique:
# This method would the calling object.

# Approach 2:
# Method call returns a new array with non-dup values of calling array - assign new array to `no_dups_arr` var
# Iterate by element for each element in input array
#   If current element is found in `no_dups_arr`
#     get the index of the first `no_dups_arr` element equal to current element's value and
#     delete using that index from `no_dups_arr`
#   Else
#     return current element
    
# Approach 3:
# Sort the array
# Iterate from 1 to (length of input array - 1), name parameter `idx`
#   If input_arr[idx] == input_arr[idx - 1]
#   return input_arr[idx]


# Critique: Wouldn't work if there's a mix of datatypes in the input array as sort is required.
# other student similar idea - mutates the calling array can avoid by making copy of input array

# Using approach 2:

def find_dup(one_dup_arr)
  no_dups_arr = one_dup_arr.uniq
  one_dup_arr.each do |element|
    if no_dups_arr.include?(element)
      no_dups_arr.delete_at(no_dups_arr.index(element))
    else
      return element
    end
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
          

# # ans key:
# There are several ways to go about solving this problem. One other way would be to have a separate array that keeps track of which items have been looked at as we iterate through the original array. If we ever add the same item twice to this second array, then we know that we have found a duplicate.

# How did you end up solving this one?

# # looking at other student's, there's more approaches to use.

# def find_dup(array)
#   array.tally.key(2)
# end

# I can guess the function of array#tally, looks like it returns a hash where the 
# hash values are the elements of calling array, and the hash values are the freq counts of each element