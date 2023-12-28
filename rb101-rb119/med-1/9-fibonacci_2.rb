# 13 min
# took me awhile to realize needed a `temp` variable in the loop which gets assigned the
# `current` value to transfer to `previous`
# when got stuck, the trick was writing out the sequence to better visualize

# fibonacci(20) == 6765
# fibonacci(100) == 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

# 11235

# return num if n is 1 or 2 (n < 2)
# assign `one_before` to 1
# assign `current` to 1
# (n - 2).times do 
#   temp = current
#   current = current + one_before
#   one_before = temp
# end

# print current


def fibonacci(n)
  return 1 if n < 2
  current = 1
  previous = 1
  (n - 2).times do
    temp = current
    current = current + previous
    previous = temp
  end
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001)

# ans key refactored this using parallel assignment.

# Other student gave good idea - just concatenate to an array sequence while looping
# and break loop once current and previous reaches back to 1, and return that sequence with last
# two deleted

def sequence
  seq_arr = [1, 1]
  first, last = 1, 1
  3.upto(60) do
    seq_arr << (first + last).to_s[-1].to_i 
    first, last = last.to_s[-1].to_i, (first + last).to_s[-1].to_i
  end
  seq_arr
end

