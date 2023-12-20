# 16:20 to solve and finish the future exploration:
# integer#digits returns digits in array in reverse
# is talking enough or do i need to write extensive notes
# join has built-in string conversion
# ['1', '2'] + '3' gives error - no implicit str to arr conversion

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# Algorithm
#  - non-mutatively slice from the input array, `arr`, `first_element` - contains just `arr`[0], another slice 'rotated_arr' contains `arr[1..-1]

def rotate_array(arr)
  # first_element = arr[0]
  # rotated_arr = arr[1..-1]
  # rotated_arr << first_element
  return [] if arr.empty?
  arr[1..-1] << arr[0]
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# Further Exploration

# Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.

# def rotate_string(str)
#   rotate_array(str.chars).join
# end

# p rotate_string('abcde') == 'bcdea'

def rotate_integer(int)
  rotate_array(int.digits.reverse).join.to_i
end

p rotate_integer(1234) == 2341