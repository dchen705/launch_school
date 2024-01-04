~21.5 minutes
didn''t know how to raise an error
1-2 minutes later - decided to just write a string saying custom error msg

highlights
- useful have some math logic
  - to figure out how much to add to get next 7 multiple, get the mod remainder and substract it from 7
  - to avoid checking even multiples of seven, start on a odd multiple of 7 and increment by 14.
  - to figure out the upper limit, we don''t need the highest num that fufills all those conditions, just the highest
    num that can fufill the unique digits condition which is 987654...etc.

# given - Integer
# return - the next featured number higher than given Integer

# rules/requirements 
# featured number:
#   - odd
#   - multiple of 7 (num % 7 == 0)
#   - unique digits
# - there''s an upper limit of featured number

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# thoughts
#   - 

# DS intermed pathway
# n = 12

# ignore
#   - numbers lower than  or equal to n
#   - find the next multiple of 7 numbers
#   - if all digits are uniq and number is odd, return number
#   - otherwise skip to next multiple of 7

# high abstract summary
# - find the next multiple of 7 that's greater than `n`, and assign to next_7_multiple
# - iterate from next_7_multiple to 1_023_456_987 (assign to upper_limit) in steps of 7, set next_num
#   - if next_num odd and next_num digits all uniq, return next_num
# - * realized requirement wants to raise an error so causing infinite loop isn't a problem
#   low levl algo
#     uniq_digits?
#       num.digits.uniq.size = num.digits.size
#     get_next_7_multiple(num)
#       (1..7) each 
#         if num + n % 7 == 0 return num + n

def get_next_7_multiple(num)
  (1..7).each do |n|
    return (num + n) if (num + n) % 7 == 0
  end
end

def uniq_digits?(num)
  num.digits.size == num.digits.uniq.size
end

def featured(num)
  next_7_multiple = get_next_7_multiple(num)
  loop do 
    return next_7_multiple if next_7_multiple.odd? && uniq_digits?(next_7_multiple)
    next_7_multiple += 7
  end
end

# refactored

UPPER_LIMIT = 1_023_456_987
def featured(num)
  next_7_multiple = get_next_7_multiple(num)
  until next_7_multiple > UPPER_LIMIT
    return next_7_multiple if next_7_multiple.odd? && uniq_digits?(next_7_multiple)
    next_7_multiple += 7
  end
  return "ERROR: There is no next featured number"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) 

ANS KEY:
break if number >= 9_876_543_210
  ^^ ah that''s a clever way... get the highest possible number
  of unique digits.
  I mentioned I sorta went a little too meta and used the 
  test case as my magic number upper limit.
  
the general approach is same 
ans key had a more efficient incrementation though:
We make it so that we only have to increment by 14. So, that takes care of the second condition. We also make sure that the number we start at for incrementation is an odd multiple of 7. If we set it up like this, then every time we add 14 we'll consistently get the subsequent odd multiple of 7."
by incrementing by 14 and starting at the next odd multiple of 7... they halve the number of
iterations to check.

other student: more mathy way of getting next multiple of 7
next_product = (integer / 7) + 1
  iterator = 0
  loop do
    next_multiple = 7 * (next_product + iterator)
    
another mathy way to get next multiple:

def next_multiple(int, multiple_of)
  int + (multiple_of - (int % multiple_of))
end

pure brute force: (didn't know you can leave range end open and seems to go for infinity)
def featured(num)
  (num+1..).each do |curr_num|
    return curr_num if curr_num.odd? && curr_num % 7 == 0 && curr_num.digits == curr_num.digits.uniq
    return 'There is no possible number that fulfills those requirements.' if curr_num >= 9_876_543_210
  end
end

probably can do this then
((next_7_multiple)..).step(7)

# refactored again
def get_next_7_multiple(num)
  num + (7 - (num % 7))
end

def uniq_digits?(num)
  num.digits.size == num.digits.uniq.size
end

def featured(num)
  next_7_multiple = get_next_7_multiple(num)
  (next_7_multiple..).step(7) do |next_num|
    break if next_num > 9876543210
    return next_num if next_num.odd? && uniq_digits?(next_num)
  end
  return "ERROR: There is no next featured number"
end