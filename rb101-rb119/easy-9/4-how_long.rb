
# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.


# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

# Examples

# Problem
#   Rules/Requirements
#     - single space is delimiter for a word
#     - all non-space characters are part of the word
#     - single words return single element arrays
#     - empty strings return empty array

# Example

# word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

# word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

# word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

# word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]

# word_lengths("") == []

# Data Structure
# (input) string -> 
# (intermed) arr of words
# (output) list of words (each word concatenated w/ integer representing word size)

# Algorithm
#  - High Level Options
#   - convert string into list of words, loop through each word in list of words - within loop: find size of word and append to word

# Code

def word_lengths(str)
  words_list = str.split(' ')
  words_list.each_with_index do |word, idx|
    words_list[idx] = word + " #{word.size}"
  end
  words_list
end


p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# forgot could use map

# 2nd passthrough

# Test cases:
  - normal 'chicken dinner tonight'
  - punctuation, symbols, etc - "2cool let's go? nah, yep"
  - empty strings - ''
  - single word - 'running'
  - double/multi spaces - 'two  spaces   three' # prompt mentions non-space characters
  # are part of substring, so multi-spaces get stripped i think.
  
# Further exploration?
# dunno

# Other high option approaches
  - split into array, transform
  - 
  
# Other student for fun:
# tried to come up with own #split method
# His high level approach was getting an array of start indexes to slice
# and an array of stop indexes to slice... which I thought was convuluted
# cuz it required multiple helper methods

# Another high abstracted option is to iterate over, nexting and starting new element
# if space encountered.

- Strip the whitespace from ends of string
- Iterate by index through this stripped string, augment arr object to return
  - for each index, `idx`:
    - char = str[idx]
    - next if `char` == ' ' && str[idx+1] == ' '
    -  if `arr` empty || char == ' '
      - concat ' ' to `arr`
    - else
        arr.last << 'char'
      
def split_str(str)
  str.chars.each_index.with_object([]) do |idx, arr|
    char = str[idx]
    next if char == ' ' && str[idx + 1] == ' '

    if arr.empty?
      arr << char
    elsif char == ' '
      arr << ''
    else
      arr.last << char
    end
  end
end

^ nice this works...