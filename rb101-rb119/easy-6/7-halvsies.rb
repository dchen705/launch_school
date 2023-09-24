# Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.
# Problem:
# given input array, output new array that has pair of elements, each element is a nested array 
# if input arr length even
# first element will contain elements from 0 up to this amount: (length / 2)
# second element will contain the remainder
# if input arr length odd
# first element will contain elements from idx 0 to this amount: (length / 2) + 1
# second element will contain the remainder

# length: 0, 2, 4
# first_element_n: 0, 1, 2
# length: 1, 3, 5
# first_element_n:1, 2, 3

# def halvsies(arr)
#   first_half_length = arr.length.even? ? arr.length / 2 : (arr.length / 2) + 1
#   [arr.slice!(0, first_half_length), arr]
# end

# def halvsies(array)
#   middle = (array.size / 2.0).ceil
#   first_half = array.slice(0, middle)
#   second_half = array.slice(middle, array.size - middle)
#   [first_half, second_half]
# end

# does float #ceil round up from .5?
# nope it rounds up <.5 too and you can use arg to control which decimal place precisely to round up to
# [6] 3.2.2 > 4.2.ceil
# 5
# [7] 3.2.2 > 4.2.ceil(2)
# 4.2
# [8] 3.2.2 > 4.2.ceil(1)
# 4.2
# [9] 3.2.2 > 

# also my solution above mutates the calling obj, if we don't wanna do that then simply do this:

def halvsies(arr)
  first_half_length = arr.length.even? ? arr.length / 2 : (arr.length / 2) + 1
  [arr.slice(0, first_half_length), arr.slice(first_half_length, arr.length - first_half_length)]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]