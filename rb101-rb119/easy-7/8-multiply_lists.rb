# Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

# =========================
# Problem

# - given 2 arrays of numbers, return a new array of same length, each element of new array is product of the element pair from each input array with matching index

# - Clarification
#   - assume 2 input arrays have same # elements
#   - what datatype are elements specifically?
#     - integers, floats?

# Data Structures
# (input) 2 arrays ->
# (output) 1 new array


# Algorithms
# - Call method on 1 input array to iteratively transform and return new array where each element is product of current element with the other input array's element of matching index


# =========================

# def multiply_list(arr1, arr2)
#   arr1.map do |ele|
#     ele * arr2[arr1.index(ele)]
#   end
# end

# ^ issue with this solution is if there's dup elements, array#index returns the first occurence.

# def multiply_list(arr1, arr2)
#   product_arr = []
#   arr1.each_with_index do |ele, idx|
#     product_arr << ele * arr2[idx]
#   end
#   product_arr
# end

# def multiply_list(arr1, arr2)
#   counter = 0
#   arr1.reduce([]) do |product_arr, ele|
#     product_arr << ele * arr2[counter]
#     counter += 1
#     product_arr
#   end
# end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |inner_arr| inner_arr[0] * inner_arr[1]}
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Other students:
# def multiply_list(array1, array2)
#   array1.map.with_index { |number, index| number * array2[index] }
# end

# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map { |subarray| subarray.inject(:*)}
# end

# def multiply_list(array1, array2)
#   array1.zip(array2) {|x| x * array2[index]}
# end

# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map { |x, y,|  x * y  }
#  end
# =========================



# =========================



# =========================