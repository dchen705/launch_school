# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

# PROBLEM

# less straightforward if toggling by even vs odd index 
# instead:
# the letter case toggles based on letters only
# Again, first char is uppercase

# DATA STRUCTURE
# (INPUT) string =>
# array of chars
# (OUTPUT) new string


# ALGORITHM
# .5) downcase input string
# 1) convert input string into array of chars, `char_arr` var assigned
# 2) initialize toggle var called uppercase and assign to true
# 2) iterate and transform `char_arr` by element (character)
#   + if `char` is not a letter => next char
#   |
#   |
#   + if `char` is a letter
#     +if `case_toggle` = 
#     |
#     |
#     +
#   |
#   |


# ========================
# def staggered_case(str)
#   letters = ('a'..'z').to_a
#   return_str = str.downcase
#   char_arr = return_str.chars
#   uppercase_counter = true
  
#   return_str = char_arr.map do |char|
#     if letters.include?(char)
#       if uppercase_counter
#         uppercase_counter = false
#         char.upcase
#       else
#         uppercase_counter = true
#         char
#       end
#     else
#       char
#     end
#   end
  
#   return_str.join
# end




# ========================

# Further Exploration
# Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state. That is, you want a method that can perform the same actions that this method does, or operates like the previous version.

# I know i can simply create an outer layer if expression but then I will have a 3-layer
# if statement which I'm wondering if that's okay?

def staggered_case(str, non_letters_toggle = true)
  letters = ('a'..'z').to_a
  return_str = str.downcase
  char_arr = return_str.chars
  uppercase_counter = true
  
  return_str = char_arr.map do |char|
    if non_letters_toggle
      uppercase_counter = !uppercase_counter
      !uppercase_counter ? char.upcase : char.downcase
    else
      if letters.include?(char)
        if uppercase_counter
          uppercase_counter = false
          char.upcase
        else
          uppercase_counter = true
          char
        end
      else
        char
      end
    end
    
  end
  
  return_str.join
end

p staggered_case('I Love Launch School!') 
p staggered_case('ALL CAPS') 
p staggered_case('ignore 77 the 444 numbers') 
# ========================



# ========================




# ========================