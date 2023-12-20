# Write a method that can rotate the last n digits of a number. For example:

# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer.

# integer is not a true collection
# an array is, 
# an Ruby lets you very easily manipulate the elements of an array.

# as a mental model, we can easily see integers as a collection of digits.

# high level approach:
# convert integer into an array of digits
# rotate a portion of this array of digits as specified by `n` (call `rotate_arr`)
# join the result with the remaining portion of the array of digits - maintaining the order of the portions
# convert back to integer

def rotate_arr(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(int, n)
return int if n <= 1

# 6 size, 4 n, 0-1 - l, 2-5
# 6 size, 3 n, 0-2 - l, 3-5
# 6 size, 2 n, 0-3 - l, 4-5


# convert integer into an array of digits
digits_arr = int.digits.reverse
left, right = digits_arr.partition.with_index do |digit, idx|
  idx < digits_arr.size - n
end

(left + rotate_arr(right)).join.to_i
# rotate a portion of this array of digits as specified by `n` (call `rotate_arr`)
# join the result with the remaining portion of the array of digits - maintaining the order of the portions
# convert back to integer
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# make sure if n = 1, original array returned