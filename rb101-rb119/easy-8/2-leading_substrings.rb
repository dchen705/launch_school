Reflection > Timing
  - took 15 min total to work through PEDAC and derive 1 working solution
  
Reflection > Communication
  - See practice below
  - a little bit concerned about speed after practicing.

Prototype Algo Summarized:
1) Iteration
  number, range, array of characters, loop with break
  a) Extract substring
    i) string#slice
      1) by index range
      2) by starting index + length
    ii) Store accumulating substring variable
  b) Concatenate substring to return object
  c) Return the return obj
    i) implicitly with #with_object or #each_with_object
    ii) implicitly with #map
    iii) initialize ex-loop var then explicity return post-loop

Learning > Low Level Implementation
  #map on ranges and chained to #upto
    Realized #map works on enumerators like range and enumerator from #upto
    Realized range can be treated like an enum and have enum methods called on them

# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.
# # ============================
# Problem

#   Rules/Requirements
#     all leading substrings from string ordered shortest to longest:
#       leading_substrings('abc') == ['a', 'ab', 'abc']

#   Insights by Associations
#     1) number of leading substrings of output is equal to length of input string (iteration pattern)
#     2) every substring starts with same letter, then every letter index excluding previous indexes, get the next character.

# Example
#   leading_substrings('abc') == ['a', 'ab', 'abc']
#   leading_substrings('a') == ['a']
#   leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# Data Structure
#   (input) string -> 
#   [] < str1 < str2 < str3
#   (output) list of substrings

# Algorithm
#   Approach 1
#     Initialize `leading_substrings` and assign to []
#     Intialize `accumulator` and assign to <<
#       For each index of input String
#         `leading_substrings` << input_string[0..idx]

#   Approach 2

# ============================
# APPROACH 1:
# def leading_substrings(str)
#   str.chars.each_index.with_object([]) do |idx, obj|
#     obj << str[0..idx]
#   end
# end

#   p leading_substrings('abc') == ['a', 'ab', 'abc']
#   p leading_substrings('a') == ['a']
#   p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
# ============================
# ^ 15 minutes up to this part

# ============================

# Approach 2:
# def leading_substrings(str)
#   accumulator = ''
#   leading_substrings = []
#   str.length.times do |idx|
#     accumulator << str[idx]
#     leading_substrings << accumulator.dup
#   end
#   leading_substrings
# end


# ============================
# Using approach 1 w/ different methods:
# def leading_substrings(str)
#   str.chars.map.with_index { |_, idx| str[0..idx]}
# end

# p leading_substrings('abc') == ['a', 'ab', 'abc']
# p leading_substrings('a') == ['a']
# p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# ============================
FURTHER EXPLORATION:
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

(input) string -> (output) list of substrings (inclusive end)

# iterate by number
(str)
str.size.times.with_object
  # slice by index range
  str.size.times.with_object([]) { |idx, obj| obj << str[0..idx]
  # slice by length
  str.size.times.with_object([]) { |idx, obj| obj << str[0, idx+1]

# iterate over a range using #upto
(str)
1.upto(str.size). { |length} 
  # slice by length
  1.upto(str.size).with_object([]) { |length, obj| obj << str[0, length] }
  # slice by index range
  1.upto(str.size).with_object([]) { |length, obj| obj << str[0..(length-1)] }

# iterate over an array of characters
(str)
str.chars.each_index.with_object
  # slice by length
  # slice by index range
    # accumulate return obj with #with_object
    str.chars.each_index.with_object { |idx, obj| obj << str[0..idx] }
    # accumulate return obj with #map
    str.chars.map.with_index { |_, idx| str[0..idx] }

# iterate over loop with break condition
(str)
until do
  
end
  # ex-loop accumulator variable (string class)
  accumulator = ''
  counter = str.size
  until counter <= 0 do
    accumulator += str[counter]
    # concatenate `accumulator` to ex-loop `sub_strings` array variable
    counter -= 1
  end

# iterative over a range v2
(str)
(0...str.size) # triple dot range excludes end value

Summary:
1) Iteration
  number, range, array of characters, loop with break
  a) Extract substring
    i) string#slice
      1) by index range
      2) by starting index + length
    ii) Store accumulating substring variable
  b) Concatenate substring to return object
  c) Return the return obj
    i) implicitly with #with_object or #each_with_object
    ii) implicitly with #map
    iii) initialize ex-loop var then explicity return post-loop

^^ See once you create this process, you see that they''re all just variations...
COMMUNICATION PRACTICE:
Spend some time communicating the below:
def leading_substrings(str)
  counter = 0
  accumulator = ''
  
  until counter >= str.size
    accumulator += str[counter]

    counter += 1
  end
end

building the loop: counter > accumulator > return obj

def leading_substrings(str)
  counter = 0
  accumulator = ''
  return_obj = []
  until counter >= str.size
    accumulator += str[counter]
    return_obj << accumulator
    counter += 1
  end
  return_obj
end

# ============================
LESSONS on 
def leading_substrings(str)
  (0...str.size).each_with_object([]) do |n, obj|
    obj << str[0..n]
  end
end
# ^ ranges can call Enum#each_with_object and Enum#map

def leading_substrings(str)
  (0...str.size).with_object([]) do |n, obj|
    obj << str[0..n]
  end
end
# ^^ #with_object method not found for range.
# however, calling #to_enum, #each, or #map on the range -> essentially a method
# that converts range to enumerator will make it work

def leading_substrings(str)
  (0...str.size).map do |n|
    str[0..n]
  end
end