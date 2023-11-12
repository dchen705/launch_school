# The reverse_sentence method should return a new string with the words of its argument in reverse order, without using any of Ruby's built-in reverse methods. However, the code below raises an error. Change it so that it behaves as expected.

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    # ^ replace with this -> reversed_words = reversed_words.unshift(words[i])
    # approach 2, reverse iteration + concatenation
    # approach 3, words[i] -> [words[i]]
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# On line 9, `words[i]` references the ith element in the array object pointed to by `words`. Each element in the array is a string; this is because on line 4, the string#split method was called on `sentence` to return a new array consisting of the substrings of the calling string. So line 9, the calling object is a String, the method is String#+ and the argument is `reversed_words` which refreences an empty array. String#+ doesn't implicity convert an array to concatenate to the calling string which results in an error.

# To resolve this we can modify by adding `words[i]` to the array object itself. Since we want words[0] to be at the end of the array and words[n] where n is the last index to be at the beginning, we should probably add to beginning of array using unshift.

# If we are okay with making a change to the original code, we can instead iterate from the last index to the first, and just use concatenation then.