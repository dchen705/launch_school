# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

# swap_name('Joe Roberts') == 'Roberts, Joe'

# Problem
#   given a string, return a reformated version of the String

# (input) string 
# (output) string 

# Algorithm
#   - High Level Options
#     - split input string into a list of words, then insert each word into reformated string literal
#     - split input string into a list of words by single space, reverse the list, join with ', '
#       ^ I'll go with 2nd one.

def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# Ans key - same solution
# Other student
# parallel assignment - I liked:
# def swap_name(name)
#   first_name, last_name = name.split
#   "#{last_name}, #{first_name}"
# end