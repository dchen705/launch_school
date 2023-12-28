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
  
  
# Further exploration
# # Can you change your solution so that the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

# Rules/Requirements
# - case-insensitive
# - remove spaces between consecutive numbers but only if they get transformed
# ie: "Five FIVE five at 12 34." -> "555 at 12 34"

# DS
# lookup table (five -> 5)
#   hash √

# input -> intermed -> output
# intermed:
#   string
#     - substring replacement √
#   array
#     - iterative transformation

# "Five FIVE five at 12 34." -> [Five, FIVE, five, at, etc] (original) ->
# [Five FIVE five, at, etc...] (new) -> [555, at, etc...]
# ^ pointer on last element



# High abstract options
#   Low algo
# - create a hash table for each number name to number digit, iterate through the hash table, for each number, replace all occurences of key with its respective value - mutatively on the input String
#   - given str
#   - initialize `name_to_digit` by zipping (0..9) and ['zero', 'one', etc] and converting to hash
#   - iterate through `name_to_digit`, for each 'num_name':
#     - 

# ^ doesn''t handle case well
# ===
# - make hash table for num name to num digit, split into word array, iterate through array - conditionally transforming only words that match a key in hash table
#   - given `str`
#   - initialize `name_to_digit` by zipping (0..9) and ['zero', 'one', etc] and converting to hash
#   - split `str` into `word_arr`
#   - iterate through `word_arr`, for each `word`
#     - if `word` downcased included in keys of `name_to_digit`
#       return the value of name_to_digit[`word`.downcase]
#       otherwise return `word`
#   - join `word_arr` and return 
# ===
# - handles joining consecutive nums that change to digits into no spaces while leaving non-transformed digits spaces alone
#   - given `str`
#   - initialize `name_to_digit` by zipping (0..9) and ['zero', 'one', etc] and converting to hash

#   - initialize `word_list_join_nums` to []
#   - split `str` and iterate through, for each `word`
#     - `last_substring` equals `word_list_join_nums[-1]
#     - if any `name_to_digit` keys included in `last_substring`
#       - if `word` downcased` included in `name_to_digit` keys
#         word_list_join_nums[-1] = last_substring + word.downcase
#       - else concatenate `word` to `word_list_join_nums`
#     - else 
#     - if `word` downcased` included in `name_to_digit` keys
#     word_list_join_nums[-1] = last_substring + word.downcase
#       concatenate word.downcase to `word_list_join_nums`
# else concatenate `word` to word_list_join_nums

#   - iterate through `word` for `word_list_join_nums`
#     - iterate through `name_to_digit`
#       - substute all occurences of `name` to its respective `digit` in `word
#       - strip `word`
  

#   - return the joined `word_list_join_nums`
  
def word_to_digit(str)
  name_to_digit = %w(zero one two three four five six seven eight nine).zip(('0'..'9')).to_h
  
  word_list_join_nums = []
  str.split.each do |word|
    last_substring = word_list_join_nums.empty? ? '' : word_list_join_nums[-1]
    if name_to_digit.keys.any? { |name| last_substring.include?(name) }
      if name_to_digit.keys.include?(word.downcase) # change to this: if name_to_digit.keys.any?{ |name| word.downcase.include?(name)}
        word_list_join_nums[-1] = last_substring + " " + word.downcase
      else
        word_list_join_nums << word
      end
    else
      if name_to_digit.keys.include?(word.downcase) # change to this: if name_to_digit.keys.any?{ |name| word.downcase.include?(name)}
        word_list_join_nums << word.downcase
      else
        word_list_join_nums << word
      end
    end
  end
  word_list_join_nums.map do |substring|
    name_to_digit.each do |num, digit|
      substring.gsub!(num, digit)
    end
    substring.gsub!(" ", "")
  end
  p word_list_join_nums.join(' ')
end

p word_to_digit("Five FIVE five at 12 34.") == "555 at 12 34."
# passed this test case


  
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5551234. Thanks.'
# failed this test case cuz '4.'' wasn't concatenated to rest of concsecutive digits. I can fix this though.

# What about dealing with phone numbers? Is there any easy way to format the result to account for phone numbers? For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be "(123) 456-7890"
def phone_number?(str, name_to_digit)
  (0..(str.size - 10)).each do |start_idx| 
    slice = str[start_idx, 10]
    binding.pry
    return true if slice.chars.all? { |char| name_to_digit.values.include?(char) }
  end
  false
end

def phone_format(str)
  "(#{str[0..2]}) #{str[3..5]}-#{str[5..-1]}"
end

I tried this but doesn't work. at first was simpler but I changed due to not being able to convert
"1234567890."
for puncutation, I need to write in logic to separate punctuation.

# Using Other students solution:
# high level approach:
# - initalize num_to_digits, split string into sentences, transform each sentence by converting digit sequences, join each sentences back together

# I realize what''s so hard, is keeping track of multiple data structures at once. have to visualize it

# having a good test case to reference is very key to anchor your algorithm. building off your algo from your test case.

# sentence - 'number is one two three four'
# word - number, is, one, two, three
# return_words - []
# digit-sequence - []

# mid level
# convert digit sequences
#   - initialize return_words to []
#   - initialize digit_sequence to []
#   - split sentences into words, iterate for each `word`:
#     - if `word` downcase key in `num_to_digits` is found
#       - concatenate value of num_to_digits[`word` downcase] to digit sequence
#     - else 
#       - if digit_sequence not empty
#         - concatenate digit sequence to return_words
#         - digit sequence set to []
#       - concatenate `word` to return_words
#   - if digit_sequence not empty, concatenate digit sequence to return words
#     digit sequence set to []
#   - return return_words.join(' ')

# format_digits
#   - given digit sequence
#   - if digit sequence is 10 in length
#     - return phone format
#   - else return digit_sequence



DIGITS = {
  "zero" => '0',
  "one" => '1',
  "two" => '2',
  "three" => '3',
  "four" => '4',
  "five" => '5',
  "six" => '6',
  "seven" => '7',
  "eight" => '8',
  "nine" => '9'
}

SENTENCE_DELIMITER = '. '

def format_digits(str)
  if str.size == 10
    "(#{str[0..2].join}) #{str[3..5].join}-#{str[6..9].join}"
  else
    str.join
  end
end

def convert_digit_sequences(sentence)
  return_words = []
  digit_sequence = []
  sentence.split.each do |word|
    if DIGITS[word.downcase]
      digit_sequence << DIGITS[word.downcase]
    else
      return_words << format_digits(digit_sequence) unless digit_sequence.empty?
      digits_sequence = []
      return_words << word
    end
  end
  return_words << format_digits(digit_sequence) unless digit_sequence.empty?

  return_words.join(' ')
end

def word_to_digit(str)
  sentences = str.split(SENTENCE_DELIMITER)
  sentences.map! do |sentence|
    convert_digit_sequences(sentence)
  end
  sentences.join(SENTENCE_DELIMITER)
end