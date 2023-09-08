# Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# reflex algo of meat of problem
# split string into array of characters
# for each character element in array,
# increment an outside intialized counter
# var

print "Please write word or multiple words: "
input = gets.chomp

char_arr = input.split(//)
char_counter = 0

char_arr.each do |char|
  if char != ' '
    char_counter += 1
  end
end

puts "There are #{char_counter} characters in '#{input}'"

# by default, split without arg splits by space delimiter so splits
# string into words. to make split by character, make argument //

# ah answer key good solution, remove the spaces and simply count characters of string.

# daamn not bad
# p "please type a word or multiple words"
# string = gets.chomp
# p "there are #{string.split.join.size} characters in #{string}"

# puts "Please write a word, or multiple words: "

# string = gets.chomp
# chars = string.scan /\S/
# puts "There are #{chars.length} chsracters in #{string}."

# ^ how does that work?