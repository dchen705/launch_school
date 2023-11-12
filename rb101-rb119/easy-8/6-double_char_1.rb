Reflection -> PEDAC
  - deliberate but slow ()
  - stumbled transition between understanding and analyzing/strategizing phases of PEDAC
    - High Level (PE: understanding + examples) -> Mid Level (DA analysis/insights/strategy) -> Low Level (C)
    - ^ I decided to create a thoughts section in A, this part is when I transitioned
    from understanding the problem, writing out test cases to unloading thoughts for
    the high level algo. 
    * honestly, I don''t use PEDAC the same way for different problems.
    - Another the step of sharing my thoughts is also to help me generate a possible
    alternative approach or two for backup in case my first approach fails.
# Write a method that takes a string, and returns a new string in which every character is doubled.

# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

# ====================
# Problem

#   Restated
#     - Takes a string, and returns a new string in which every character is doubled
#   Rules/Requirements
#     - spaces/punctuation are also doubled
#     - if given empty string, then returns empty string

# Examples
#   repeater('Hello') == "HHeelllloo"
#   repeater("Good job!") == "GGoooodd  jjoobb!!"
#   repeater('') == ''
# Data Structure

#   string (input) ->
#   (black box)
#   new string (output)

#   black box
#     Iterative DS Possibilities
#       - String 
#         - iterate over characters 
#       - Array
#         - iterate over each element (characters)
#       - Hash
#         unnecssary tbh
      
#     New Object to hold and return values from each iteration


# Algorithm
#   Thoughts
#     - likely need iteration over each character
#     - likely use a block and some concatenation to push doubled characters into some object
  
#   Language Toolbox
#     String#each_char
#     String#chars

#   # Can I highlight things in coderpad

#   Approach 1:
#     - Intialize `doubled_chars` to ''
#     - Iterate over characters in input String, set `char` as current character
#       - `doubled_chars` << `char`` * 2
#     - Return `double_chars`

#   Approach 1 v2:
#   (Approach 1 but use array instead)


# ====================
def repeater(str)
  doubled_chars = ''
  str.each_char do |char|
    doubled_chars << char * 2
  end
  doubled_chars
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# ====================

# Other students ideas:

# #map

str.map { |char| char * 2 }.join

# #reduce

str.reduce('') { |doubled_str, char| doubled_str << (char * 2) }
# #with_object

str.each_char.with_object('') do |char, doubled_str|
  doubled_str << (char * 2)
end
# #zip 

str.chars.zip(str.chars).join
# join handles nested arrays