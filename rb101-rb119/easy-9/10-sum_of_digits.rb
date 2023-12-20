# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# should print true.

# For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).

# High Level Approaches
#   Option 1 - type convert into array of single digits, then sum up 
#   Option 2 - reduce into a running_total

def sum(int)
  int.to_s.chars.reduce(0) {|sum, digit| sum += digit.to_i}
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# More approaches:
  # 

 # ans key: 
  23.to_s        # => "23"
  .chars       # => ["2", "3"]
  .map(&:to_i) # => [2, 3]
  .reduce(:+)  # => 5
  
# other students:
  def sum(int)
  int.digits.sum
end

# Without using #digits:
def sum(int)
  int.to_s.chars.map(&:to_i).sum
end

def sum(int)
  int.digits.inject(&:+)
end