# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# print("What is your name? ")
# name = gets.chomp

# if name.end_with?('!')
#   puts("HELLO #{name.upcase}. WHY ARE WE SCREAMING?!")
# else
#   puts("Hello #{name}.")
# end

# ah you can index select a character from a string using negative integers
# to select in reverse... like so name[-1] -> selects last character of string.

# could have used chop or chop! to remove the last character too.

print 'What is your name? '
name = gets
name.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}! WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end