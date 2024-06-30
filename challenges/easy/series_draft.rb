# 34:38 to finish
# 37:50 to complete rubocop
# 53:ish to successful refactor
# Given
# - string of digits, integer specifying length of each return string

# return
# - all cons number series of specificed length in input string (as an array of arrays of numbers)

# Rules/Requirements:
# - Invalid length (greater than size of digit string) - error thrown
#   Implicitly
#     - return array, number series of outer array are ordered by their ordering from input string
#     - consecutive:
#       does not mean numerically consecutive, or 1 and 2 are consective, 1 and 3 are not
#       consecutive in position of the input string
#       ie:
#         134
#           1 and 3 are consective per prompt, though not numerically consecutive
# 01234

# what if 02134?

# specified length:
# 1 - each digit
# 2 -

# Examples / Test Cases
# Series class
#   constructor
#     - 1 arg = string of digits
#   `slices`
#     - 1 arg = integer

# DS
# String of digits -> (beware integer conversion drops leading zeros)
# Array of string (single chars)
# Array of arrays of numbers

# String -> Array of chars

# '01234' -> ['0', '1', '2', etc...]
# 2 ways to slice.
#   1) start idx + length
#   2) start idx + end idx
#     ^ i like 2, we can loop until end_idx reaches end of array
#     what''s important is 2 pointers that increment by 1 per iteration, the distance
# in values between those pointers is initially established and doesn''t need changing

# say n = 4
# << [0, 1, 2, 3]
# Algo
#   Control Structures
#     Iteration
#       for slice 2, from idx 0 to str.size - 2

#       start_idx = 0
#       end_idx = n - 1 (where n is arg, specified length)

#       while end_idx < arr.size
#         start and end increment 1
# High Lvl Summary
# - given string of digits, `digits` and integer, `length`
# - raise arg error if length > size of digits
# - convert `digits` to `digit_list` #chars and #map to_i
# - set [] as `num_series`
# - iterate and concat to `numseries`
#   set start and end idx
#   while
#     slice
#     increment
#     end_idx
# - return

class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    raise ArgumentError if length > @digits.size

    digit_list = @digits.chars.map(&:to_i)

    num_series = []
    start_idx = 0
    end_idx = length - 1

    while end_idx < digit_list.size
      num_series << digit_list[start_idx..end_idx]
      start_idx += 1
      end_idx += 1
    end
    num_series
  end
end
