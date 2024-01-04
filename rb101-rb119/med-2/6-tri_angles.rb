11 min

# given - 3 integers representing degrees of a possible triangle
# output - type of triangle (4 choices)
#   right One angle of the triangle is a right angle (90 degrees)
#   acute All 3 angles of the triangle are less than 90 degrees
#   obtuse One angle is greater than 90 degree
#   invalid any angle is zero or sum of angles doesn''t equal 180

# rules/requirements
# - assume inputs are always integers
  



# DS intermed pathway
#   - #splat parameter -> 60, 70, 50 => [60, 70, 50]
#   - Array#sum Array#any? zero?

# High abstract summary
# - convert input ints to single array, check conditions using an if statement, invalid, right, obtuse, 
#   Low level algo
#     - given 3 integers which will be put into an array using *, `angles`
#     - return :invalid if `angles` sum != 180 or angles any zero?
#     - if angles any is equal to 90
#     - elsif angles any is greater than 90
#     - else

def triangle(*angles)
  return :invalid if angles.sum != 180 || angles.any? { |angle| angle.zero?}

  if angles.any? { |angle| angle == 90}
    :right
  elsif angles.any? { |angle| angle > 90}
    :obtuse
  else
    :acute
  end

end
  
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

ANS KEY
similar logic
- could have used array#include?(90) and array#include?(0)