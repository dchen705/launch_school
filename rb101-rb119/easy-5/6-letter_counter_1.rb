# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# Try strat thought of last exercise:
# rework my problem solving note taking to use more visuals and more step by step
# input to output and functions delimination?

# Prob:

# initiate hash `counts_for_word_sizes`

# each word is delimited by spaces
# "blah blah" ->
# ['blah', 'blah']

# iterate over ['blah', 'blah'], parameter `word`

#   set `n` = word.size
  
#   Does hash have key == to n
#   |
#   +-- N? Create hash key == n, set hash value to 1
#   |
#   +-- Y? increment hash value +1


def word_sizes(str)
  counts_for_word_sizes = {}
  words = str.split
  words.each do |word|
    if counts_for_word_sizes.keys.include?(word.size)
      counts_for_word_sizes[word.size] += 1
    else
      counts_for_word_sizes[word.size] = 1
    end
  end
  counts_for_word_sizes
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}