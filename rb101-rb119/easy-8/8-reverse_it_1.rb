17:08
feels like I shouldn''t have need that much time to solve it.
Array#split and String#join -> didn't need to iterate and concatenate

# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# PROBLEM
#   - given string, return new string w/ words in reverse order

#   RULES/REQUIREMENTS
#     - words are substrings delimited by whitespace
#     - whitespaces are removed from the output
#     - empty string is returned if given empty String

# EXAMPLES
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# DATA STRUCTURE
# (IN) string 'Hello World' ->
# [
#   A1
#   array of words ['Hello', 'World'] 

#   [] << 'World' << 'Hello'
# ]
# (OUT) new string World Hello

# ALGORITHM

#   Lang Tools
#     String#Split

      #each_with_object, #map, #reduce, 
      #Array#join

#   Approaches
#     A
#       - get array of words from input String, set to `word_arr`
#         use Array#split
#           *this handles test cases of '' and '    '
#       - return '' if `word_arr` == []
#       set empty array
#       - set `reverse_arr` == []
#       - iterate in reverese order through the array, concatenate each word to `reverse_arr`
# - join reverse_arr and convert to str

def reverse_sentence(str)
  word_arr = str.split
  return '' if word_arr == []
  word_arr.reverse.each_with_object([]) do |word, reverse_arr|
    reverse_arr << word
  end.join(' ')
end
      
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# Ans key was a one-liner