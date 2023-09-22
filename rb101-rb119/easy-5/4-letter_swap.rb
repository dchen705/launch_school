# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces.

# Problem Understanding
# Restate:
# Assume argument `string` is given.
# Assume `string` contains only space delimiters and words
# Assume each word of `string` is at least 1 letter.
# Assume `string` contains at least 1 word.

# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# Algorithm:
# Split `string` into an array called `words_arr` delimited by spaces
# for each element `word` in `words_arr`
#   if element `word` size is greater than 1
#     assign `temp_letter_holder` var to first character of `word`
#     assign last character of `word` to first character of `word
#     assign `temp_letter_holder` to last chaacter of `word`
      # ^remember #string[]= mutates but #string[] doesn't
# join words
    

def swap(string)
  words_arr = string.split
  words_arr.each do |word|
    if word.size > 1
      temp_letter_holder = word[0]
      word[0] = word[-1]
      word[-1] = temp_letter_holder
    end
  end
  words_arr.join(" ")
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
