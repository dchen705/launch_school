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

def fibonacci_last(num)
  idx = num % 60 - 1
  sequence[idx]
end

p fibonacci_last(123_456_789_987_745)

# I could also refactor using recursion but nah.

def get_last_digit_loop_seq
  loop_seq = [1, 1]
  loop do
    loop_seq << (loop_seq[-1] + loop_seq[-2]) % 10
    break if loop_seq[-1] == 1 && loop_seq[-2] == 1
  end
  loop_seq.slice(0..-3)
end

def normalize_to_1_to_loop_end(n, loop_end)
  n % loop_end
end

def fibonacci_last(n)
  last_digit_seq = get_last_digit_loop_seq
  
  n = normalize_to_1_to_loop_end(n, last_digit_seq.size)

  last_digit_seq[n - 1]
end

# Nice this is much clearer and also shorter
# last_digit_seq => [1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 0, 7, 7, 4, 1, 5, 6, 1, 7, 8, 5, 3, 8, 1, 9, 0, 9, 9, 8, 7, 5, 2, 7, 9, 6, 5, 1, 6, 7, 3, 0, 3, 3, 6, 9, 5, 4, 9, 3, 2, 5, 7, 2, 9, 1, 0]
# last_digit_seq.size => 60