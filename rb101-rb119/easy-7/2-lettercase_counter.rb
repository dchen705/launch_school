# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one represents the number of characters that are uppercase letters, and one represents the number of characters that are neither.

# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# also what if character is not an alphabetical character?
# note space characters are included.
# ================================

# ALGORITHM:
# 1) Iterate input string by character, set parameter `char`
#   a) if char is uppercase then hash value of :uppercase += 1
#     etc....
    
# (1a) - soo...is there built in ruby method to check case or do we have to check manually?



# ================================

def letter_case_count(string)
  case_counter_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  (string.length).times do |idx|
    char = string[idx]
    if !('a'..'z').include?(char) && !('A'..'Z').include?(char)
      case_counter_hash[:neither] += 1
    elsif char == char.downcase
      case_counter_hash[:lowercase] += 1
    elsif char == char.upcase
      case_counter_hash[:uppercase] += 1
    end
  end
  case_counter_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# ================================
# ANS KEY:
# different approach:
# def letter_case_count(string)
#   counts = {}
#   characters = string.chars
#   counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
#   counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
#   counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
#   counts
# end

# other students:
# def letter_case_count(string)
#   { lowercase: string.count('a-z'),
#     uppercase: string.count('A-Z'),
#     neither: string.count('^A-Za-z') }
# end
# ================================



# ================================