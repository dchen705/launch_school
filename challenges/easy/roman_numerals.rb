# # this question - algo didn't immediately jump out.. looking at test cases will help.
# Also look back at other's solutions, there's variety of solutions

# # Convert modern numbers to roman numerals

# I, V, X, L, C, D, M
# 1, 5, 10, 50, 100, 500, 1000

# Test cases:
# III = 3
# IV = 4

# IX = 9

# 49 / 10

# 649 / 10

# roman numerals are a composition of each base 10:

# number = RomanNumeral.new(27)
#     assert_equal 'XXVII', number.to_roman

# number = RomanNumeral.new(59)
#     assert_equal 'LIX', number.to_roman

# so we divide into digits

# this may be too brute force, but I have idea of how to use
# DS

# we have 4 bases of 10, we can just create a hash for each base, the key being the base and value being
# an array of 9 elements representing each digit in ascending

# the number can be represented as an array of digits

# {
#   0 => %w(I II III IV V VI VII VIII IX)
#   1 => %w(X XX XXX XL L LX LXX LXXX XC)
#   2 => %w(C CC CCC CD D DC DCC DCCC CM)
#   3 => %w(M MM MMM)
# }
# # problem said stopping by 3000

# Algo
# - convert number to array of digits
# - reverse the array of digits
# - iterate with index through reversed array
#   - reducing roman numerals by hash lookup
    # Detailed:
    #   - reduce(''), set `num` and `digit_place`
    #     concat roman_numeral[digit_place][num - 1] + `num`

class RomanNumeral
  CONVERSION_HASH =
  {
    0 => %w(I II III IV V VI VII VIII IX),
    1 => %w(X XX XXX XL L LX LXX LXXX XC),
    2 => %w(C CC CCC CD D DC DCC DCCC CM),
    3 => %w(M MM MMM)
  }

  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_roman
    roman_numeral = ''
    num.digits.each_with_index do |digit, index|
      next if digit == 0
      roman_numeral = CONVERSION_HASH[index][digit - 1] + roman_numeral
    end
    roman_numeral
  end
end
