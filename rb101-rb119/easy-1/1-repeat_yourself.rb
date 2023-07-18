# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# # input
# repeat('Hello', 3)

# output
# Hello
# Hello
# Hello

# Me
# How to print string multiple times?
# a method that takes string and number?

# or use a loop...
# ^yup that'll work.

# PEDAC
# 1. Process the problem - understand it
# a.
# inputs?
# string
# num

# output
# string x num on separate lines printed

# b.
# requirements explicit? > 
# domain knowledge: fundamentals:
# i need to know what are and how to use methods and loop
# need to know to how to ask for input and print 

# 2nd pass:
# I realized missed detail - positive integer
# so i need to validate too

# 2. Examples/Test case
# see input output above

# 3. Data Structure
# strings and numerics input, output as string

# 4. Algo
# -create counter
# -define method that takes string and 
# -step in method, create while loop that stops at counter= num
# -increase counter by 1 then step out of method
# -ask for user input string and num
# -validate number is positive num using while loop
# -run method

# 5. Code with intent
# realizing i forgot basic syntax like while loops

# oops realized, I overdid it. don't need to get user input. just write the method and run it.


# ^^ what can i improve 
# overdid it.

counter = 0

def repeat_self(str, num, counter)
  
  while (counter != num)
    puts str
    counter += 1
  end
  
  
end

repeat_self('Hello', 6, counter)

# answer key used number.times do end block