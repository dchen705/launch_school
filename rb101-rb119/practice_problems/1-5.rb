15:00
Breaking out of iterative method by setting break inside the given block
Array#index with a block, returns first occurence of array in which equal to return value of block?

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

# DS
# [
#   A:
#   [Fred, 0], ['Barney', 1], etc..
# ]

# ALGO

# High-Level
  # - loop through array, check for every iteration, then return once true


# Mid_Level
#   - counter/break loop through array, break if element[0, 2] = "Be" and return the `counter` or `index`
#     - manual loop
#     - iterative method - like each_with_index
  
#   - 
 
# Hash#select

# A2:
# p (flintstones.each_with_index do |name, idx|
#   break idx if name[0, 2] == 'Be'
# end)

# A1:
# idx = nil
# counter = 0
# until counter >= flintstones.size
#   idx = counter if flintstones[counter][0..1] == "Be"
#   counter += 1
# end
# p idx

# Can you `break` out of a iterative method?
# yes, 

# Ans Key:

# flintstones.index { |name| name[0, 2] == "Be" }