# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# ===================================
# PROBLEM

# every letter case is swapped

# DATA STRUCTURE
# (INPUT) string ->
# (OUTPUT) new string


# ALGORITHM

# create 2 array constants for a-z and A-Z

# 1) split string into array of characters, `chars_arr`
# 2) for every `char` in `chars_array`
#   if char included in a-z
#     then char = A-z[a-z.index(char)]
#   else if char included in A-Z
#     vice versa....

# ===================================
def swapcase(string)
  lowercase_chars = ('a'..'z').to_a
  uppercase_chars = ('A'..'Z').to_a
  
  string.chars.map do |char|
    if lowercase_chars.include?(char)
      uppercase_chars[lowercase_chars.index(char)]
    elsif uppercase_chars.include?(char)
      lowercase_chars[uppercase_chars.index(char)]
    else
      char
  end
end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# ===================================




# ===================================



# ===================================