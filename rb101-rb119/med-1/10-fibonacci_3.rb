def fibonacci_last(n)
  return 1 if n < 2
  current, previous = 1, 1
  (n - 2).times do 
    current, previous = (current + previous) % 10, current % 10
  end
  current
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4

# Further exploration:
  - option 1
    - find when loops back to 1, 1
    - after trial and error, found loops back to 1, 1 when at n = 61
    
def get_loop_end
  current, previous = 1, 1
  num = 3
  loop do
    current, previous = (current + previous) % 10, current % 10
    return num - 1 if current == 1 && previous == 0
    num += 1
  end

end

def fibonacci_last(n)
  return 1 if n < 2
  current, previous = 1, 1

  n %= get_loop_end

  (n - 2).times do |x|
    current, previous = (current + previous) % 10, current % 10
  end
  current
end

# ^ this works, but it wasn't very clear
# ^ I had to play around with `get_loop_end` to make sure it landed
# on the right number which took trial and error, showed i was hack and slashing
# # probably have to rewrite logic in `get_loop_end`

def get_loop_end
  current, previous = 1, 1
  num = 3
  loop do
    current, previous = (current + previous) % 10, current % 10
    return num - 2 if current == 1 && previous == 1
    num += 1
  end
end

def normalize_to_1_to_loop_end(n, loop_end)
  n % loop_end
end

def fibonacci_last(n)
  return 1 if n < 2
  current, previous = 1, 1

  n = normalize_to_1_to_loop_end(n, get_loop_end)

  (n - 2).times do |x|
    current, previous = (current + previous) % 10, current % 10
  end
  current
end

p fibonacci_last(123_456_789_987_745) # -> 5

^ slightly clearer with making get_loop_end more clear condition and more abstraction

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