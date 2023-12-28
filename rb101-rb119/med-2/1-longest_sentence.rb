# 33 minutes
# hint showed regex which would have shortened time but I wanted a challenge
# also didn't know how to open a text file and save as a string.


# Given - text consisting of sentences made up of words
#   (string)

# Return - a string and a number
#   string - represents longest sentence
#   number - represent # of words in longest_sentences

# Rules/Requirements
#   - sentences end with a ".", '?', "!"
#   - words are delimited by spaces
#   - any non-space characters are part of a word


# High Abstract Option
#   - get a list of all `sentences` from input `text` (`get_sentences`)
#     DS
#         - 'abc. def! xyz?' ->
#         ['abc.','def!','xyz?]'
#           - copy the text and assign to 'text_cp'
#           - intialize `sentences` arr to []
#           - loop
#             - iterate from index 0 to (size - 1) of text_cp, set current_idx
#               - if current_char is "., !, ?" then
#                 - slice mutatively from index 0 to current_idx, strip sentence and append to sentences list
#                 -break iteration
#             break if text_cpy.empty?

#           ^^ infinite loops if text doesn't end with punctuation

# #   - sort `sentences` by the number of words they contain
# #     - get `word_count` from 'sentence'
#         'abc. bcd!'' -> ['abc.', 'bcd!']
#         - split sentence into `words` delimited by space and then get count of list of `words`


#   - reference the `longest` sentence, print it and also print the number of words it contains

PUNCTUATION = ['.', '!', '?']

def get_sentences(text)
  text_cp = text.dup
  sentences = []
    loop do 
      (0..(text_cp.size - 1)).each do |idx|
        current_char = text_cp[idx]
        if PUNCTUATION.include?(current_char)
          sentences << text_cp.slice!(0..idx).strip
          break
        end
      end
      break if text_cp.empty?
    end
  sentences
end

def get_word_count(sentence)
  sentence.split.size
end

def long_sentence(text)
  sentences = get_sentences(text)

  sorted_sentences = sentences.sort_by do |sentence|
    get_word_count(sentence)
  end
  
  longest_sentence = sorted_sentences[-1]

  highest_count = get_word_count(longest_sentence)

  [longest_sentence, highest_count]
  

end

puts long_sentence(text)
