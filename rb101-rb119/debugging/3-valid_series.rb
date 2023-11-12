# The valid_series? method checks whether a series of numbers is valid. For the purposes of this exercise, a valid series of numbers must contain exactly three odd numbers. Additionally, the numbers in the series must sum to 47.

# Unfortunately, our last test case is not returning the expected result. Why is that?

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count = 3 ? true : false # change to odd_count == 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

# The last test case returns true because on line 9,
# `odd_count = 3` is an assignment expression that evaluates to truthy so true will be returned from the ternary conditional. To fix, we would simply change the ternary condition to an equality expression, `odd_count == 3`, this will ensure only when there's 3 odd numbers in `num` will method return true (after also passing the check that sum of numbers are 47 on line 6)


# Further Exploration

# If you take a close look at odd_count == 3 ? true : false, you see that the equality comparison odd_count == 3 itself returns a Boolean. Is the ternary operator on line 5 really necessary in order to return a Boolean from our method?

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end