# Key lessons:
# - (P) - basic math logic
# # Understanding the Problem
# given triangle, return its type based on side lengths
# also spent time trying to optimize the algo for determining scalene but in end just went brute force
  # Ans key: ah, forgot this tech: sides.uniq.size == 1

# rules/requirements:
# - valid triangle has sides > 0
# - valid triangle: sums of any 2 lengths > remaining length
#   assume: lengths are [a, b, c] sorted in ascending
#   ***STRUGGLED with logic, coming up with own test cases for scenarios - time consuming
#   a + b > c (if true)
#   b + c > a

#   a + c > b

#   b > c - a
#   b > a - c (has to be true if all > 0)

#   c > b - a ()

#   ^^ reason: failed to state:
#   a <= b <= c

#   c by itself is greater than a or b individually.
#   ***
# - equilateral - same lengths
# - ...

# 3 main types

# # Example/Test Cases
# Triangle object with 3 arguments, #kind method that returns 'equalilateral', etc..

# - Float values for sides valid
# - validity check raises argumenterror during object creation #new call

# # Data structure
# [a, b, c] where a <= b <= c

# # Algo
# - test for validity
#   sides all > 0
#   a + b > c
# - test for types
#   - equaliteral
#   - scalene
#   - isosceles (by POE)

class Triangle
  attr_reader :sides
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3].sort.map(&:to_f)
    raise ArgumentError, 'Triangle sides are invalid.' unless valid_sides
  end

  def kind
    if sides[0] == sides[1] && sides[0] == sides[2]
      'equilateral'
    elsif sides[0] != sides[1] && sides[0] != sides[2] && sides[1] != sides[2]
      'scalene'
    else
      'isosceles'
    end
  end

  private

  def valid_sides
    sides.all? { |side| side > 0 } && sides[0] + sides[1] > sides[2]
  end
end

# Refactored:
class Triangle
  attr_reader :sides

  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3].sort.map(&:to_f)
    raise ArgumentError, 'Triangle sides are invalid.' unless valid_sides?
  end

  def kind
    return 'equilateral' if sides.uniq.size == 1
    return 'isosceles' if sides.uniq.size == 2
    'scalene'
  end

  private

  def valid_sides?
    sides.all? { |side| side > 0 } && sides[0] + sides[1] > sides[2]
  end
end