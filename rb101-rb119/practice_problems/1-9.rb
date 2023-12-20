6:14
# As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

words = "the flintstones rock"

# words = "The Flintstones Rock"

# Write your own version of the rails titleize implementation

# Algorithm
#   > High Level
#     - split string into array of words
#     - for each word in `word_arr`
#       - downcase all characters
#       - upcase first character
#     - join

p (words.split.map! do |word|
  word.capitalize
end).join(' ')

