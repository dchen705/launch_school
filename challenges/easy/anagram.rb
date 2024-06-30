# 24 min to solve
# g: word, a list of words
# r: sublist of anagrams

# explicit:
# def: anagram is a rearrangment of letters of a word into another word, typically count-matched in characters

# relationship:
#   anagrams have matching sorted character arrays

# implicit
#   - fail cases:
#     - empty strings [not tested]
#   - identical words not anagrams
#   - Cases
#     - anagrams are case-insensitive

# Ex/Test Cases:
# - Anagram class
#   - constructor
#     - initialized w/ string

#   - `match`
#     accepts list of strings
#     returns sublist of anagrams

# DS:
# string against an array of strings
# may convert potential anagrams strings to array of characters

# Algo
# High Lvl:
# 1. Brute iteration
#   iterate through each `new_word` in `word_list
#   if new_word.downcase anagram? to `word.downcase` (the original word),
#     concat `new_word` to anagrams
# 2. Convert to array of chars, Sort by ascii value then select
#   - select iterate through `word_list`, for each `new_word`
#     - `word` downcased sorted character array == new-word's

class Anagram
  def initialize(word)
    @word = word
  end

  def match(word_list)
    word_char_arr = sorted_char_arr(@word)
    word_list.select do |new_word|
      next if new_word.downcase == @word.downcase
      word_char_arr == sorted_char_arr(new_word)
    end
  end

  private

  def sorted_char_arr(word)
    word.downcase.chars.sort
  end
end

# refactored
class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(word_list)
    anagram_key = sorted_char_arr(@word)
    word_list.select do |new_word|
      anagram_key == sorted_char_arr(new_word.downcase) && new_word.downcase != @word
    end
  end

  private

  def sorted_char_arr(word)
    word.chars.sort
  end
end

# refactored again
class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(word_list)
    anagram_key = sorted_char_arr(@word)
    word_list.select do |new_word|
      anagram?(new_word.downcase, anagram_key) && new_word.downcase != @word
    end
  end

  private

  def anagram?(word, key)
    word.chars.sort == key
  end
end

# other students
#tally method