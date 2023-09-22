# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# cleanup("---what's my +*& line?") == ' what s my line '

# Problem:

# Restated:
# prompt summarized well

# Algo:
# Approach 1:
# (F)replace all non-alphabetic characters with space
# pre-loop var initializations
#   `char_idx` - increments by +1, represents each char 
#   `first_space_detected` == false
#   `start_idx` == 0
#   `end_idx` == 0
#   `index_ranges_of_multi_spaces` = []
# (F)loop iterate the string,
#   if string[char_idx] == ' ' && !first_space_detected
#     first_space_detected == true
#     start_idx == char_idx

#   elsif string[char_idx] == ' ' && first_space_detected
    
  
#   elsif string[char_idx] != " " && first_spaced_detected
#   end_idx == char_idx
#   index_ranges_of_multi_spaces << start_idx..end_idx
#   first_space_detected == false
#   end
#   char_idx += 1
# end
# (F) iterate over index_ranges_of_multi_spaces
# each range parameter
# assign `num_of_spaces` var to `idx_range`.size
# string.sub!(" " * num_of_spaces, " ")
 

# ^ I felt like if I pursued other approaches, I'd have to method hunt which not allowed
# to do on interview which why I avoided here. This approach uses basic tools. Unfortunately
# took me 20 minutes to prelim brainstorm then 20+ minutes to write out the algo
# Part of it was I was also curious how long this approach would actually take me...
# so hopefully in future, I can better plan which algo to use.
# Then it took me 40 minutes to implement into code (inc troublshooting.)
# from my unpolished pseudocode algo
# Not good.
# so really 20 minutes to do P and then EDAC done in 60 minutes.
# Also sunk cost... once I was like 20+ min into EDAC, I was like this is taking longer
# than expected but I was worried trying to come up with a better approach would have
# take about as long if not longer.

# # Approach 2:
# # regex - don't know how to use yet


# Approach 3:


# Approach 1 Code:
# cleanup("---what's my +*& line?") == ' what s my line '

# def cleanup(original_string)
#   alpha_and_multispaces = original_string.chars.map { |char| ('a'..'z').include?(char) ? char : " "}.join
#   p alpha_and_multispaces
#   arr_index_ranges_of_multi_spaces = get_array_of_index_ranges_of_multispaces(alpha_and_multispaces)
#   p arr_index_ranges_of_multi_spaces
#   clean_str = replace_multi_spaces_with_single_space(alpha_and_multispaces, arr_index_ranges_of_multi_spaces)
# end

# def get_array_of_index_ranges_of_multispaces(string)
#   char_idx = 0
#   first_space_detected = false
#   start_idx = 0
#   end_idx = 0
#   index_ranges_of_multispaces = []
  
#   while char_idx < string.size
#     if string[char_idx] == ' ' && !first_space_detected
#       first_space_detected = true
#       start_idx = char_idx
#     elsif string[char_idx] != " " && first_space_detected
#       end_idx = char_idx
#       index_ranges_of_multispaces << (start_idx..(end_idx-1))
#       first_space_detected = false
#     end
    
#     char_idx += 1
#     if char_idx == string.size && first_space_detected
#       index_ranges_of_multispaces << (start_idx..(char_idx-1))
#     end
    
#   end
#   index_ranges_of_multispaces
# end

# def replace_multi_spaces_with_single_space(string, arr_index_ranges_of_multi_spaces)
#   arr_index_ranges_of_multi_spaces.each do |idx_range|
#     string.sub!(" " * idx_range.size, " ")
#   end
#   string
# end

# p cleanup("---what's my +*& line?") == ' what s my line '

# p cleanup("#$!##$I want to be #@$#$ with this!!!!")
# Passed test case, but didn't work with my own custom string...

# figured it out, the I is uppercase and not included as we assumed lowercase alphabetical chars
# Also my function `get_array_of_index_ranges_of_multispaces` didn't get the index
# range in case first_space_detected was true and char iteration ends.

# so added this:
# if char_idx == string.size && first_space_detected
#       index_ranges_of_multispaces << (start_idx..(char_idx-1))
# end

# I will try to refactor and then ask Chatgpt to help. Maybe come up with new logic

# The positives of my code:
# I broke steps into functions which made it easier to read the logic. This had side effect
# of making easier to isolate and identify where the problem came from

# Alt approaches:
# know string#scan can filter certain patterns of calling string into an array
# not sure if works in this case.
# #scan requires regex argument, i found out.

# my own approach:
# simplify the process of changing multispaces into spaces?
# could i use string#split to separate spaces from alphabeticals?
# or maybe do it manually through iteration?

# "this   is a  test"
# []

# wait as soon as I saw this in coder pad:
# "this   is a  test".split =>
# [
#     [0] "this",
#     [1] "is",
#     [2] "a",
#     [3] "test"
# ]

# it clicked.

# I just have to chain split.join(" ") then add in space for first and last index....

# rework my problem solving note taking to use more visuals and more step by step
# input to output and functions delimination?

def cleanup(dirty_string)
  # return new string with each non-alphabetical lowercase char replaced with a space
  alpha_and_spaces = dirty_string.chars.map! { |char| ('a'..'z').include?(char) ? char : " "}.join
  
  # return new string w/ multispaces and margin spaces removed, then rejoined with single spaces 
  clean_string = alpha_and_spaces.split.join(" ")
  
  # prepend and concatenate a space if dirty_string had non-alphabetical char at beginning and
  # end respectively
  
  clean_string.prepend(" ") if alpha_and_spaces[0] = " "
  clean_string << " " if alpha_and_spaces[-1] = " "
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup("#$!##$I want to be #@$#$ with this!!!!")
