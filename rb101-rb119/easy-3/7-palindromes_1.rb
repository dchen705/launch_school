# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

# take a string
# make another string that's reverse of original string
# check if string and reversed string are equal

def palindrome?(str)
  reverse_str = str.reverse
  reverse_str == str
end

def arr_palindrome?(arr)
  arr == arr.reverse
end

p arr_palindrome?('madama')

wait, aren't they all just the same methods? they can take either arrays or string because they share the same .reverse name?