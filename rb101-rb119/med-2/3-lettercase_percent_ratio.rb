28:27
working with hashes and started to struggle towards end because I didn''t connect my data structures
from input to output
# given - a String
# return - a hash containing three ratio entries out of 100:
#   - lowercase, uppercase, neither characters

# Rules/Requirements
#   - always at least one character
#   - round to 1 decimal
#   - float division

# letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }


# Data Structure
# letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }

#   total character count = 10 characters
#   counts for each lowercase and uppercase
  

#   rounding?
#   #round() method

# Algorithm
#   - get counts of lowercase
#     - select lowercase characters from string and count them
#   - similar for uppercase
#   - remaining count from total character becomes the neither count

# Approach 1
# - get total_character_count convert it to float 
# - get lowercase chars, uppercase chars from count_characters, 
# - by substracting ^ above from total_character_count, get the remainder for neither_chars
# - put the values in a array by concatenating the three keys
# - calculate_ratio for all three

# -count characters(str, chars_to_count = '')
#   return str.count if chars_to_count is empty
#   otherwise count of chars_to_count characters in String

# - calculate ratio()
#   - example: (lowercase_chars / total_char_count).round(1) -> ratio and 

# - convert to hash by manually putting each ratio into an outer array with 3 2-element inner arrays

def count_chars(str, chars_to_count)
  str.count(chars_to_count)
end

def calculate_ratio(total_char_count, count)
  (count / total_char_count * 100).round(1)
end

def letter_percentages(str)
  total_char_count = Float(str.size)
  counts_list = []
  counts_list << 'lowercase' << count_chars(str, 'a-z')
  counts_list << 'uppercase' << count_chars(str, 'A-Z')
  neither_count = total_char_count - counts_list[1] - counts_list[3]
  counts_list << 'neither' << neither_count

  ratio_list = counts_list.map.with_index do |count, idx|
    if idx.even?
      count
    else
      calculate_ratio(total_char_count, count)
    end
  end

  ratio_hsh= {}

  ratio_list.each_slice(2) do |type, count|
    ratio_hsh[type.to_sym] = count
  end
  ratio_hsh

end

# refactor
def count_chars(str, chars_to_count)
  str.count(chars_to_count)
end

def calculate_ratio(total_char_count, count)
  (count / total_char_count * 100).round(1)
end

def letter_percentages(str)
  total_char_count = Float(str.size)
  counts_list = []
  counts_list << [:lowercase, count_chars(str, 'a-z')]
  counts_list << [:uppercase, count_chars(str, 'A-Z')]
  counts_list << [:neither, count_chars(str, '^a-zA-Z')]

  ratio_list = counts_list.map do |type, count|
    [type, calculate_ratio(total_char_count, count)]
  end

  p ratio_list.to_h

end

# Further exploration
Already accounted for rounding

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Other Student:
def letter_percentages(string)
  hash = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }

  hash.transform_values do |regex|
    (string.count(regex) * 100.0 / string.size).round(1)
  end
end

