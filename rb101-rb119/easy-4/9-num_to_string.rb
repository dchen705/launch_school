# def integer_to_string(num)
#   num_array = num_to_array(num)
#   num_array.join
# end

# def num_to_array(num)
#   num.digits.reverse
# end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

# Refactored:

# def integer_to_string(num)
#   num.digits.reverse.join
# end

# p integer_to_string(4321) == '4321'
# p integer_to_string(0) == '0'
# p integer_to_string(5000) == '5000'

# another student solution
# [num].digits -> yeah, that's kinda cheap...

# Solution 2:
# try not to use array#join as it has built in type conversion. In fact try not to use
# any methods that type convert at all..

# I skimmed answer key... oops... one option seems to be using a hash key.
# So make a hash key, iterate through the integer how?
# turn integer into a collection?
# just iteratively reassign integer to divmod?

def integer_to_string(integer)
  integer_to_string_key = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
  7 => '7', 8 => '8', 9 => '9'}
  dividend = integer
  str = ''
  while dividend > 0
    divide_by_10 = dividend.divmod(10)
    dividend = divide_by_10[0]
    remainder = divide_by_10[1]
    str.prepend(integer_to_string_key[remainder])
  end
  integer > 0 ? str : '0'
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# answer key:
# ah right this works as the key too...
# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
# because index corresponds with the number of element pointer.
# also naming key DIGITS was more succinct.
# didn't know divmod return value can be assigned like this:
# number, remainder = number.divmod(10)

# Further exploration:
# How many mutating String methods can you find that do not end with a !. Can you find any that end with a !, but don't have a non-mutating form? Does the Array class have any methods that fit this pattern? How about the Hash class?