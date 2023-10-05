# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Problem:

# spaces delimit words
# words are sequences of characters

# How should 2 or more blank characters be treated?
# not in the test cases.

# What if first letter is not a letter
# don't upcase any following letters.
# I tested string#upcase on a nonletter character, just returns the char not raise an error.

# Output string has to:
# start (have first character) be uppercase
# all other letters (chars after first char) to be lowercase

# Data Structure:

# (INPUT) string ->
# array of words ->
# (OUTPUT) new string

# ALGORITHM:

# Approach 1:
# split (using spaces as delimiters) input string into array of words
# iterate over the array of words:
#   for each word, downcase every character, then upcase the first character
# join the array of words, adding space as delimiter

# ===================================

def word_cap(string)
  word_arr = string.split
  word_arr.map do |word|
    word.downcase!
    word[0] = word[0].upcase
    # word[0].upcase!
    # ^ note this won't work, because string#[] returns a new string which gets mutated.
    word
end
  word_arr.join(" ")
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# ===================================
# ANS KEY
# def word_cap(words)
#   words.split.map(&:capitalize).join(' ')
# end
# ^ forgot about the string#capitalize method, 



# ===================================

# Further Exploration
# Two solutions that don't require string#capitalize
# 1) downcase every character then upcase first letter of every word
# 2) check if first char is a lowercase letter by ascii value then add the difference to convert to
# uppcase? <- seems roundabout.
# 3) Use regex maybe?

# Other student idea:
# 4) use arrays that hold the lower and uppercase letters.

# ===================================