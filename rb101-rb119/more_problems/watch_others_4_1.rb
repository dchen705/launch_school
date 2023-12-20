# < 18 min

# other student came up with a better approach of just iterating over characters of str1
# then checking only the 2 length substrings if included in str2

# given - 2 strings
# return - boolean 
#   true : 2 input strings contain a shared substring,
#   ignore 1 character substrings


# rules/requirements
#   case-insensitive comparisons for substrings

# high level options
#   iterative brute force
#     - generate all potential_substrings from 1 input String 
#       - edge: if empty string
#     - iterate each substring in potential_substrings,
#     ehcking if 2nd input string contains the substring
#       return true if yield_self
    
#     - return false

# Language toolbox
#   String#include?


def generate_substrings(str)
  length = str.size
  substrings = []
  # iterate from index 0 to index length - 1, set start_index
  (0..(length - 1)).each do |start_idx|
    # iterate from index start_index + 1 to index: length - 1, set end_idx
    ((start_idx + 1)..(length - 1)).each do |end_idx|
      substring = str[start_idx..end_idx]
      # slice from start to end idx and concatenate to substrings array if slice is greater than 1 in length
      substrings << substring if substring.size > 1
    end
  end
  substrings
end

def substring_test(str1, str2)
  substrings_1 = generate_substrings(str1)
  substrings_1.each do |substring|
    return true if str2.downcase.include?(substring.downcase)

  end
  false

end

p substring_test('Something', 'Fun')
p substring_test('Something', 'Home')
p substring_test('Something', '')
p substring_test('', 'Home')
p substring_test('', '')
p substring_test('banana', 'BANANA')
p substring_test('1234567', '541265')

# Other student in vid came up with what I think is a more efficient and more clever
# approach
# made use of reducing the bounds of the problem by implicit truths

# observation is: 2+ length shared substrings are irrelevant, because a 3 length substring implies
# there's a 2 length substring that's shared too. so only need to check all 2 length substrings

# reducing the problem boundaries
#   - 2+ length substrings are irrelevant, only 2 length subsrings need to be checked

# Iterate through characters of str1 with index
# check if current character + next character is included in str2
# - downcase to make case-insensitive - return true if found in str2

def substring_test(str1, str2)
  
  str1.each_char.with_index do |char, idx|

    if idx == str1.size - 1
      next
    end
    
    next_char = str1[idx + 1]
    substring = (char + next_char).downcase
    
    return true if str2.downcase.include?(substring)

  end
  false

end
