# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# instinct (going straight to the algo)
# use while loop + counter to repeat
# add an if statement to check odd or even to return 1 or 0


# my instinct is to skip through ped and go straight to ac
# for simple easy probs, getting better at seeing how pedac 
# fits into personal problem solving process
  

# def stringy(num)
#   counter = 0
#   while (counter != num)
    
#     counter += 1
#   end
# end


# up to this point i realize my instinct missed a detail, i needed
# to know string interpolation too.

def stringy(num)
  counter = 0
  string = ''
  while (counter != num)
    if (counter % 2 == 0)
      string = string + '1'
    else
      string = string + '0'
    end
    counter += 1
  end
  return string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# answer key

# def stringy(size)
#   numbers = []

#   size.times do |index|
#     number = index.even? ? 1 : 0
#     numbers << number
#   end

#   numbers.join
# end

# create empty array
# iterate block of code using .times
# use .even and ternary operation on the index of block to push new number to array
# use .join to string combine elements of arrays