# Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.

# ========================================

# PROBLEM

# output string:
# assuming starts at index 0 then
# even indexed characters are uppercase
# rest are lowercase

# DATA STRUCTURE
# (INPUT) string ->
# array of characters
# (OUTPUT) new string

# ALGORITHM
# .5) downcase every character
# 1) Convert input string into `char_arr`, array of characters
# 2) Iterate w/ index over `char_arr`, for `char`
#   If idx is even then
#   upcase `char`


# ========================================
# def staggered_case(string)
#   string.downcase!
#   string.chars.each_with_index do |char, idx|
#     if idx.even?
#       char.upcase!
#     end
#   end.join
# end

# oh wait, realized this modifies and returns the calling string, they requested a new string returned

# def staggered_case(string)
#   new_str = string.downcase
#   new_str.chars.each_with_index do |char, idx|
#     if idx.even?
#       char.upcase!
#     end
#   end.join
# end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


# ========================================

# Further Exploration

# Can you modify this method so the caller can request that the first character be downcased rather than upcased? If the first character is downcased, then the second character should be upcased, and so on.

# Hint: Use a keyword argument.

def staggered_case(string, start_uppercase = true)
  new_str = string.downcase
  
  new_str.chars.each_with_index do |char, idx|
    if start_uppercase
      char.upcase! if idx.even?
    else
      char.upcase! if idx.odd?
    end
  end.join
  
end

p staggered_case('I Love Launch School!', false)
p staggered_case('ALL_CAPS')
p staggered_case('ignore 77 the 444 numbers', true)

# ========================================



# ========================================