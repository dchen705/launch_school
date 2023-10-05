# Write a method that returns the next to last word in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# ========================================================

# Problem
#   Requirements and Rules
#     - words delimited by spaces
#     - assume input string at least 2 words
  
# Data Structure
#   (input) string ->
#   array -> 
#   (output) new string

#   Visual Breakdown
#     2 words -> 1 space; return before nth space
#     3 words -> 2 spaces; return between nth space and n-1 space
#     4 words -> 3 spaces; return between nth space and n-1 space

#     Approach 2.2
#       "this test" -> "tset sith"
#       [] << s..i..t.. h...

# Algorithm
#   Prelim Thoughts
#     - 

#   Approach 1: convert string to array of words then return penultimate element


#   Approach 2: count number of spaces, return the word between (n-1)th and nth space - exeception when only 1 space
#     - method that returns array of index for every occurence of a character in a string?
#       - I'll test it', nope... #index doesn't seem to allow 2nd arg to specify you wanna find the 2nd occurence
#     - Subapproach
#       - clone words, count number of spaces and assign to n, delete n-1 times the space character, splice substring based on index of first occurence of space, etc...
#     - Subapproach 2:
#       reverse the string
#       for index of first space to index of last char
#         concenate to new array
#       - reverse back

#   Scrapped
#     - Approach 2: convert string to array of characters

# ========================================================

# def penultimate(str)
#   penultimate_word = ''
#   reversed_str = str.reverse
#   last_space_idx = reversed_str.index(" ")
#   last_char_idx = str.length - 1
#   (last_space_idx + 1).upto(last_char_idx) do |idx|
#     break if reversed_str[idx] == " "
#     penultimate_word << reversed_str[idx]
#   end
#   penultimate_word.reverse!
# end

# def penultimate(str)
#   str.split[-2]
# end

# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# ========================================================

# Further Exploration

# Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

# Problem

# Edge Cases

#   middle('')
#   middle(23)
#   middle(one)
#   middle(even number of words)
#   middle(odd number of words now)

# Data Structure
  
#   No string?
  
#   No words?
  
#   One word?
  
#   Even #
#     4 elements -> 2
#     6 element -> 3
#     n / 2 - 1
#   Odd #
#     3 elements -> 2 
#     5 elements -> 3
#     7 elements -> 4
#     n / 2 + 1 - 1

# Algorithm

# ========================================================
def middle(str)
  return "error: string argument required" if str.class != String
  return str if str.count(" ") == 0
  words = str.split
  n = words.length
  if n.odd?
    words[n / 2]
  else
    words[n / 2 - 1]
  end
end

p middle('')
p middle(23)
p middle('one')
p middle('even number of words')
p middle('odd number of words now')

# Other student good point:
# need to consider multiple spaces in a row and trailing spaces.

# Other student wanted both words if even number of words
# another student said what if 2 words, no middle there either

# my solution fails for when there's only 2 words.

# feels like algorithm writing was what I focused on but it detracted from me coming up with all the edge cases