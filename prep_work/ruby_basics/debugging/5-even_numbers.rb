# We want to iterate through the numbers array and return a new array containing only the even numbers. However, our code isn't producing the expected output. Why not? How can we change it to produce the expected result?

# numbers = [5, 2, 9, 6, 3, 1, 8]

# even_numbers = numbers.map do |n|
#   n if n.even?
# end

# p even_numbers # expected output: [2, 6, 8]

# # isn't n if n.even? always going to evaluate to true? So
# I'd expect all the numbers to get printed. 
# Nope it returned 
# [nil, 2, nil, 6, nil, nil, 8]

# numbers = [5, 2, 9, 6, 3, 1, 8]

# even_numbers = numbers.map do |n|
#   n.even?
# end

# p even_numbers

# ^ this outputs:
# [false, true, false, true, false, false, true]

# okay, i think i get it, we should be using select not map method
# because .map modifies the array with the block while select takes 
# the block and uses it as a condition and only returns those elements that meet that condition.

numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n.even?
end

p even_numbers