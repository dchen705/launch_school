# ~ 11 min
-> 7:50 Worked through PEDA
# given 2 string arguments
#   str1 - 
#   str2 - 
#   condition - every character in str2 can be found in str1 (count matching)

# return - boolean depending on if condition is met

# 'javaass', 'jjss'
# 'rkqodlw', 'world'

# 'jjss' -> 'j'..'j'...
# 'javaass' -> 'avaass' -> XXX -> return false

# #delete -> nope
# string#sub!('j', '')

# str 1 duplicate

# Approach
#   - given str1 and str2
#   - copy and assign value of str1 to str1_cp
#   - iterate through each character in str2, set `char`
#     - delete first occurence of char from str_cp 
#       - if can't delete, returns nil, then return false
#   - return true


def scramble(str1, str2)
  str1_cp = str1.dup 
  str2.each_char do |char|
    binding.pry
    return false if !str1_cp.sub!(char, '')
    # return false unless... (works too)
  end
  true
end
p scramble('javaass', 'jjss')
p scramble('rkqodlw', 'world')