# 45 min to solve... spent too long debating whethr to use hash, regex or define a custom string method so I
# can use map(&:custom_conversion_method)
# g: word
# r: scrabble score of word

# def
# scrabble score is the sum of the individual tile score of each letter of a given word as defined
# by the tile scoring table (see reference)

# implicit:
#   fail cases:
#     - chars not on scoring table count as 0.
#     - nil as arg counts as zero
#     - scores are case-insensitive

# Ex/Test cases
# - Scrabble class
#   - constructor
#     - object (usually a string)

# DS:
# list of chars to iterate through

# lookup table
# %w(A E I O ...) => 1

# Algo
# - iterate by char, summing up their reppective tile score

# - convert to a char list, transform into score list then sum list
#   constructor
#   - if nil, set to emtpy string
#     upcase the string

#   `score`
#   - convert word to char list
#   - transform char list, for each char
#     - iterate through `table`, for each `letter_set`
#       if char included in letter_set
#         return corresponding value of letter_set
#     - return 0 otherwise
# * midway through, I realized maybe I can use regex
# I could also use a long if statement with regex, maybe create a custom String method to make map with &?

# abc = String.new('abc')

# abc.def

# end

# didn't notice class method

# can an instance method be invoked for a class method... something tells me no.

def to_score(char)
    if char.match(/[AEIOULNRST]/)
      1
    elsif char.match(/[DG]/)
      2
    elsif char.match(/[BCMP]/)
      3
    elsif char.match(/[FHVWY]/)
      4
    elsif char.match(/[K]/)
      5
    elsif char.match(/[JX]/)
      8
    elsif char.match(/[QZ]/)
      10
    else
      0
    end
end

class Scrabble
  def initialize(word)
    @word = word ? word.upcase : ''
  end

  def score
    @word.chars.map do |char|
      to_score(char)
    end.sum
  end

  def self.score(word)
    word.upcase.chars.map do |char|
      to_score(char)
    end.sum
  end
end

# 2 ways to improve lookup
# * both utilizing hash
# 1) hash find - return the value for which corresponding key returns true for block execution
# 2) iterate through hash, match the word against the values of hash (which are regex patterns)
  # ie: /[AEIOU]/.match('A')

# Iterate over hash of string keys, each key interpolated into a reg pattern // literal, if match
# then return corresponding value

#SCORE_TABLE = {
#   AEIOULNRST: 1,
#   DG: 2,
#   BCMP: 3,
#   FHVWY: 4,
#   K: 5,
#   JX: 8,
#   QZ: 10
# }

def to_score(letter)
  SCORE_TABLE.each do |letter_set, score|
    return score if letter.match(/[#{letter_set}]/)
  end
  0
end

class Scrabble
  def initialize(word)
    @word = word ? word.upcase : ''
  end

  def score
    @word.chars.map do |char|
      to_score(char)
    end.sum
  end

  def self.score(word)
    word.upcase.chars.map do |char|
      to_score(char)
    end.sum
  end
end

# Iterate over keys of regex patterns, matched to a letter, return corresponding value
# more annoying to write out each regex pattern, easier ot interpolate into an iterative block

SCORE_TABLE = {
  /[AEIOULNRST]/ => 1,
  /[DG]/ => 2,
  /[BCMP]/ => 3,
  /[FHVWY]/ => 4,
  /[K]/ => 5,
  /[JX]/ => 8,
  /[QZ]/ => 10
}

def to_score(letter)
  SCORE_TABLE.each do |letter_set, score|
    return score if letter_set.match(letter)
  end
  0
end

class Scrabble
  def initialize(word)
    @word = word ? word.upcase : ''
  end

  def score
    @word.chars.map do |char|
      to_score(char)
    end.sum
  end

  def self.score(word)
    word.upcase.chars.map do |char|
      to_score(char)
    end.sum
  end
end

# the other way to solve is iterate by character and track a running total

# refactor after ans key:

SCORE_TABLE = {
  AEIOULNRST: 1,
  DG: 2,
  BCMP: 3,
  FHVWY: 4,
  K: 5,
  JX: 8,
  QZ: 10
}

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word ? word.upcase : ''
  end

  def to_score(letter)
  SCORE_TABLE.each do |letter_set, score|
    return score if letter.match(/[#{letter_set}]/)
  end
  0
  end

  def score
    word.chars.map do |char|
      to_score(char)
    end.sum
  end

  def self.score(word)
    self.new(word).score
  end
end

# Other student used reduce to concisely run at total

class Scrabble
  attr_reader :score

  EXPS_N_POINTS = {
    /[aeioulnrst]/ => 1,
    /[dg]/         => 2,
    /[bcmp]/       => 3,
    /[fhvwy]/      => 4,
    /k/            => 5,
    /[jx]/         => 8,
    /[qz]/         => 10
  }

  def initialize(word)
    @word = word
    @score = self.class.score(word)
  end

  def self.score(word)
    return 0 unless word.instance_of?(String)
    EXPS_N_POINTS.reduce(0) do |acc, (exp, score)|
      acc + word.downcase.scan(exp).size * score
    end
  end
end

# also this part was pretty out of box:
# @score = self.class.score(word)

class Scrabble
  attr_reader :word

  LETTERS_SCORE = [
    ['AEIOULNRST', 1],
    ['DG', 2],
    ['BCMP', 3],
    ['FHVWY', 4],
    ['K', 5],
    ['JX', 8],
    ['QZ', 10]
  ].freeze

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil?

    word_upcase = word.upcase

    LETTERS_SCORE.reduce(0) do |total_score, (letters, score_per_letter)|
      total_score + word_upcase.count(letters) * score_per_letter
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

# ^ we can probably refactor his solution to use regex in the iterative block instead, removing need
# to create separate variable for word upcase
# nvm, string#count doesn't accept regex arguments - tested on irb and confirmed on docs