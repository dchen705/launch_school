# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(n)
  str = n.to_s
  str == str.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# no, let's say 00101, should be palindromic
# but the to_s method cannot differentiate
# the leading 0s as not part of the number.
# so to address this, eliminate leading 0s
# with a while statement that scans first
# digit and deletes digit if == to 0.

# # student answers show i was wrong..
# number literal with leading 0s evaluate
# to octal number.