Timing
  - took 15 min for PEDAC and working solution while talking
  - looking at video, I can see lots of processing time (pauses)
  - looking back, nothing I did was super wrong, 
  - I think I just need to get more comfortable with these basic ones, so I do them faster.
  
It''s worth to revisit other students ideas.

# Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

# substrings('abcde') == [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]

# # ====================

# Problem
#   Restated
#     Given a string, return a list of all substrings of that input string
#   Rules/Requirements
#     - ordering
#       first by starting index position of original String
#         then by shortest to longest

#   Thoughts
#     - by iterating by index through the string and adding the substrings, we will sort substrings by index. 
#     - 
# Example

# Data Structure
#   (input) string ->
#   (black box)
#   (output) array of strings

#   Thoughts+
#   black box
#     'abcde' -> all substrings starting at index 0, then all substrings at index 1, etc... -
#       within the set of substrings sharing same starting index position
#         we can get an ending index starting from starting index to length of string - 1 (or a non-end inclusive range)

#         ^ nested iteration of the string

#     Algorithm
#       - `str` assigned to input String
#       - `all_substrings` assign to []
#       - Iterate from 0...str length (call current elment `strt_idx`)
#         - Iterate (level 2) from strt_idx to str length (current element == end_idx)
#           - concatenate str[strt_idx...end_idx] to `all_substrings`
# ====================
def substrings(str)
  all_substrings = []

  (0...str.length).each do |strt_idx|
    (strt_idx...str.length).each do |end_idx|
      all_substrings << str[strt_idx..end_idx]
    end
  end

  all_substrings
end

p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]
# ====================
# 2nd Pass:
# using `leading_substring` helper
def leading_substring(str)
  str.size.times.with_object([]) do |end_idx, arr|
    arr << str[0..end_idx]
  end
end

def substrings(str)
  (0...str.size).each.with_object([]) do |start_idx, arr|
    whole_substring = str[strt_idx..(str.size - 1)]
    arr = arr + leading_substring(whole_substring)
  end
end

def leading_substring(str)
  str.size.times.with_object([]) do |end_idx, arr|
    arr << str[0..end_idx]
  end
end

def substrings(str)
  (0...str.size).each.with_object([]) do |start_idx, arr|
    whole_substring = str[start_idx..(str.size - 1)]
    # why doesn't below work?
    # arr = arr + leading_substring(whole_substring)
    # arr represents the local block variable which is temporary to each iteration. the new `arr` of the next iteration will point back to the original argument array. you must mutate the argument array itself
    arr << leading_substring(whole_substring)
  end.flatten
end
p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]

# ====================
# lesson 1: each_with_object, with_object's parameter designated local varaible
# doesn't work the way you expect - NOT a single block parameter-designated variable
# shared between iteration; rather, a new block parameter designated variable (with same name)
# gets initialized each time.