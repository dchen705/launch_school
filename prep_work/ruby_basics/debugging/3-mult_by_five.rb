# When the user inputs 10, we expect the program to print The result is 50!, but that's not the output we see. Why not?

# def multiply_by_five(n)
#   n * 5
# end

# puts "Hello! Which number would you like to multiply by 5?"
# number = gets.chomp

# puts "The result is #{multiply_by_five(number)}!"

# Is this because number is a string, and the * method doesn't
# work on string? Need to convert number to integer with .to_i
# hmm actually, * method does exist for strings, and it replicates
# that character by that argument of *.

def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "The result is #{multiply_by_five(number)}!"