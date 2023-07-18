# Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

# reflect algo
# just prompt for 4 different string variables
# then print out a string interpolated amalgamation

print "Enter a noun: "
noun = gets.chomp
print "Enter a verb: "
verb = gets.chomp
print "Enter an adverb: "
adverb = gets.chomp
print "Enter an adjective: "
adjective = gets.chomp

print "I just went to #{verb} my #{noun} over a #{adjective} toast very #{adverb}. \n"


#  how to stay on same line as prompt when inputting?
# print