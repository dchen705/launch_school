# 24:30 to solve initial
# got stuck for time figuring out the 2nd future exploration
  # other solutions seem to use regex for part 2 future explore
  # ...it gets complicated w/o it.
# language fluency
  # forgot about array#zip and array#to_h combo


# Given - a string which represents a sentence of words
# return - the input string mutated such taht ie:
#   "one" -> '1'
#   "two" -> '2'

# Rules/Requirements
#   - 'zero' to 'nine' -> '0' to '9'


# word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# 'two four five' -> ['two four five']

# [['zero', '0']]to.h
# {'zero' => '0', ...}

# - Initialize and assign a word_to_digit hash table
# - Convert input string to array of words
# - iterate through each word
#   - for that word, iterate through key of `num_words`
#     if an `num_word` is included in `word`
#       then sub! first occurence of `word` with corresponding `digit_word`
#       ^ association determined by index position

# # - Transform(!) each word if matches a key in key-value pair in a table, change to value
# #   - delete punctutation before check for match

# word_digits_arr = []

#   num_words.each_with_index do |word, index|
#     digit = num_digits[index]
#     word_n_digit = [word] << digit
#     word_digits_arr << word_n_digit
#   end

#   word_digits_table = word_digits_arr.to_h


# def word_to_digit(sentence)
#   num_words = ['zero', 'one', 'two', 'three', 'four', 'five','six', 'seven', 'eight', 'nine']
#   num_digits = ('0'..'9').to_a

#   sentence.split.each do |word|
#     num_words.each_with_index do |num_word, index|
#       if word.include?(num_word)
#         sentence.sub!(num_word, num_digits[index])
#       end
#     end
#   end
#   sentence
# end

# def word_to_digit(sentence)
#   num_words = ['zero', 'one', 'two', 'three', 'four', 'five','six', 'seven', 'eight', 'nine']
#   num_digits = ('0'..'9').to_a
#   p num_words.zip(num_digits).to_h

#   num_words.each_with_index do |num_word, index|
#     sentence.gsub!(num_word, num_digits[index])
#   end
#   sentence
# end

# p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Further Exploration
# - Capitalized and uppercase

# 'zero'
# 'Zero'
# 'ZERO'
# -> '0'

# - Selectively transform only 'num_words' to downcase version
# - then run the solution we have
# - iterate through every word of sentence
#   - get a punctuation-free downcased version of `word`, set to `test_word`
#   - check if `test_word` is included in keys and then if so, transform into word.downcase otherwise keep as word

# def word_to_digit(sentence)
#   num_words = ['zero', 'one', 'two', 'three', 'four', 'five','six', 'seven', 'eight', 'nine']
#   num_digits = ('0'..'9').to_a
#   word_digit_table = num_words.zip(num_digits).to_h

#   # selectively transform only `num_words` within `sentence` to downcase
#   sentence = sentence.split.map do |word|
#     test_word = word.delete('^A-Za-z').downcase
#     word_digit_table.keys.include?(test_word) ? word.downcase : word
#   end.join(' ')
#   # iterate through _num_words and sub all instances with corresponding digits frmo num_digits

#   num_words.each_with_index do |num_word, index|
#     sentence.gsub!(num_word, num_digits[index])
#   end
#   sentence
# end


# p word_to_digit('Please call me at Five FIVE five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


# Can you change your solution so that the spaces between consecutive numbers are removed?

# Can you change your solution so that the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

word_to_digit('Please call me at Five FIVE five one two three four. Thanks 1 2 3.') == 'Please call me at 5551234. Thanks 1 2 3.'

['at', 'Five', 'FIVE', 'five'] =>
['at' 'Fivefivefive']



[] <<
- given array of strings, `words`
- initialize `word_to_add` to ''
- initialize `num_words_joined to []
- iterate over `words` with index, for each `word` and `idx``
  - get `test_word`
  - get `next_test_word`
  
