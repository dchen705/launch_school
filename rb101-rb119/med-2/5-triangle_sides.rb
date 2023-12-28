21:43
# input - 3 integers representing lengths of a possible triangle
# output - a symbol representing type of triangle (4 choices)

# rules/requirements
#   - two shortest two sides length sum must be greater than the remaining side''s, all lengths must be greater than 0
#   - equilateral All 3 sides are of equal length
#   - isosceles 2 sides are of equal length, while the 3rd is different
#   - scalene All 3 sides are of different length



# Thoughts
# - case or if statements, explicit returns

# High Abstract Option
#   Low Algo
#   - check each definition of triangle one by one
#     - given side1, side2, side3
#     - return :equilateral if equilateral?
#       - str1 == str2
#       - str1 == str3
#     - return :invalid if invalid?
#       - sort ascending str1 - str3, assign to sides_sorted
#       - `sides_sorted`[0..1].sum > sides_sorted[2]
#     - return :isoceles if isoceles?
#       - [side1, side2, side3] count side1 == 2 or count side2 == 2
#     - return :scalene if scalene?
#       - [side1, side2, sid3] remove duplicates,  check that size is same 
# ===

def equilateral?(side1, side2, side3)
  side1 == side2 && side1 == side3
end

def invalid?(side1, side2, side3)
  sides_sorted = [side1, side2, side3].sort
  return true if sides_sorted.any? { |side| side.zero? }
  sides_sorted[0..1].sum <= sides_sorted[2]
end

def isosceles?(side1, side2, side3)
  sides = [side1, side2, side3]
  sides.count(side1) == 2 || sides.count(side2) == 2
end

def scalene?(side1, side2, side3)
  [side1, side2, side3].size == [side1, side2, side3].uniq.size 
end

def triangle(side1, side2, side3)
  return :equilateral if equilateral?(side1, side2, side3)
  return :invalid if invalid?(side1, side2, side3)
  return :isosceles if isosceles?(side1, side2, side3)
  return :scalene if scalene?(side1, side2, side3)
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# Refactorable - in this case, probably better to just keep as one case statement, if you split into helpers, more 
# redundancy

# also becuz you check equilateral before invalid - if you're test case was 0, 0, 0 - it would pass when should fail

# any quick way to check that all elements in array are different?
# arr == arr.uniq

# Ans key -
used case statement kept all check conditions in same method - which allowed
them to simplify logic into one-liners due to process of elimination
ie: side1 == side2 || side1 == side3 || side2 == side3 => was logic for isoceles
and works cuz it followed the equilateral check 

# High level approaches from others
- using uniq and size to determine triangle type based on 1, 2, 3
- for invalid? - checking difference of (lengths summed - max length) is less than max length

parallel assignment triple
def triangle(side1, side2, side3)
  sa, sb, sc = [side1, side2, side3].sort
  return :invalid if sa == 0 || sa + sb < sc
  return :equilateral if sa == sb && sa == sc
  return :isosceles if sb == sc 
  :scalene
end

dude this one liner, using the return value of sides.uniq.size as indexing
# one-liner
def triangle(*sides)
  sides.sort!.take(2).sum > sides.last ? %i[equilateral isosceles scalene][sides.uniq.size - 1] : :invalid
end
good use of splash operator

logic
"It's not necessary to check for zero in this method because, in a sorted array, the first two elements can't be greater than the third if one of them is zero. array.uniq.size returns the number of different elements in the array."