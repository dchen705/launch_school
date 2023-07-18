# Write a method that will take a short line of text, and print it within a box.

# reflex data structure
# ^ this time instincts tell me to write out the output's data line by line

# Example
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# 5 lines
# the start and end char are constant values from line 1-5 are (+, |, |, |, |)
# the middle chars are == " " + either - or " " times input_string's length + " "

# DS i will print out?
# I know how to either use arrays of chars and convert to string or strings directly

# if i use arrays of chars, i learned can use .join to convert to string

# reflex algo
# The main pattern here is we are printing in 2D, i can solve it with a
# a nested loop (from experience)
# The outer loop will cursor select lines 1 through 5 
# step into the outer loop
# we shall set if else for each index to print each data structure specified

# ah so for printing 2d DS, i like to do EDAC...


# def print_in_box(str)
#   5.times do |line|
    
#     entire_line = []
    
#     if line == 1 || line == 5
#       mid_line = []
#     elsif line == 2 || line == 3
      
#     else 
      
#     end
    
#   end
# end

# at this point in code, i realized i need to look up how to add look up
# string length checking method and adding elements from one array to another.
# I realize alternatively to a loop and if statement, more simply
# i could have just made 5 puts statements in order for each line.

# def print_in_box(str)
#   5.times do |line|
    
#     entire_line = []
    
#     if line == 0 || line == 4
#       entire_line << '+'
#       (str.length + 2).times do |idx|
#         entire_line << '-'
#       end
#       entire_line << '+'
#       puts entire_line.join
      
      
#     elsif line == 1 || line == 3
#       entire_line << '|'
#       (str.length + 2).times do |idx|
#         entire_line << ' '
#       end
#       entire_line << '|'
#       puts entire_line.join
      
#     else 
#       entire_line << '| '
#       entire_line << str
#       entire_line << ' |'
#       puts entire_line.join
      
#     end
    
#   end
# end

# print_in_box('this is a test')
# print_in_box('')

# something i might need to work on is taking a bit of time to come up with 1-2 ideas
# instead of jumping to first idea that comes to mind. my fear is that i cannot
# think of alternatives in reasonable time.

# but answer key is simpler... well actually it's within same 1-1.25 magnitude so won't nitpick

# def print_in_box(message)
#   horizontal_rule = "+#{'-' * (message.size + 2)}+"
#   empty_line = "|#{' ' * (message.size + 2)}|"

#   puts horizontal_rule
#   puts empty_line
#   puts "| #{message} |"
#   puts empty_line
#   puts horizontal_rule
# end

# they relied more on string interpolation.

# further exploration:
# truncates message if too wide for standard window (80 columns)

# low complexity - only reflex algo required

# simply pre-iteration, use conditional to check length of string
# and truncate to 80 length

# def print_in_box_trun(str)
#   if str.length + 4 > 76
#     str = str.slice(0, 76)
#   end
  
#   end_line = "+#{'-' * (str.length + 2)}+"
#   empty_line = "|#{' ' * (str.length + 2)}|"
  
#   puts end_line
#   puts empty_line
#   puts "| #{str} |"
#   puts empty_line
#   puts end_line
  
# end

# print_in_box_trun('this is a test')
# print_in_box_trun('')
# print_in_box_trun('crazy long line crazy long line crazy long line crazy long line crazy long line crazy long line 
# crazy long line crazy long line crazy long line crazy long line crazy long line crazy long line crazy long line 
# crazy long line crazy long line crazy long line crazy long line crazy long line crazy long line crazy long line 
# crazy long line crazy long line crazy long line crazy long line crazy long line crazy long line 
# crazy long line crazy long line crazy long line crazy long line crazy long line crazy long line')


# wrapping long lines

# for this feature, i strongly suspect one method is pre-iterative
#   printing, we first take the long string as input and use
#   a loop to recursively break it down into smaller chunks
  
# low complexity - i guess my reflex intuition is enough.

# actually i want to check DS
# we need to make an array of arrays of single chars, total elements of the inner arrays 76 or less
# i can also output array of strings too..

# back to algo
# once i make the recursive method that takes long string and outputs array of arrays... i can simply
# iterate the outer arrays to print the long str.




# base case is if str > greater than 76
# need method that splits off original string mutating original and returning split substring in intial. since its
# recursion, calling from top of stack, we will split from the back, and join into array at the post-recursion portion
# of the method... doesn't rly matter,, i can iterate array in reverse too.



# splits long string into array of strings with size >= 76 chars
def split_long_str(str, arr)
  
  if str.length > 76
    sub_str = str.slice!(0, 76)
    arr.push(sub_str)
    split_long_str(str, arr)
    
  else
    if arr != [] # if string needs to wrap, the last line that's less than 76 chars, will get filled the with whitespace to match other previous lines
      str = str.insert(str.length, ' ' * (76 - str.length))
    end
    arr.push(str)
    
  end
    
end

def print_in_box_wrap(str)
  arr = []
  
  if str.length < 76
    end_line = "+#{'-' * (str.length + 2)}+"
    empty_line = "|#{' ' * (str.length + 2)}|"
  elsif str.length >= 76
    end_line = "+#{'-' * 78}+"
    empty_line = "|#{' ' * 78}|"
  end
  
  split_long_str(str, arr)
 
  
  puts end_line
  puts empty_line
  arr.each { |x|
    puts "| #{x} |"
  }
  puts empty_line
  puts end_line
  
end


print_in_box_wrap('this is a test')
print_in_box_wrap('crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line'\
' crazy long line crazy long line crazy long line')

# realized behavior of arr << str, is not creating arrays of strings separated by commas
# no, according to docs they are, i guess its the puts that's removing the commas
# how to iterate arrays again?

# realized for multiline strings, I needed to concatenate them
# couldn't simply hit enter -> as that gets interpreted as part of string


# note to self: 
# coming up with initial strat by intuition and reversing from end goal

# End goal - we want this:
# +------------------------------------------------------------------------------+
# |                                                                              |
# | crazy long line crazy long line crazy long line crazy long line crazy long l |
# | ine crazy long line crazy long line crazy long line crazy long line crazy lo |
# | ng line crazy long line crazy long line crazy long line crazy long line craz |
# | y long line crazy long line crazy long line crazy long line crazy long line  |
# | crazy long line crazy long line crazy long line crazy long line crazy long l |
# | ine crazy long line crazy long line crazy long line crazy long line crazy lo |
# | ng line crazy long line crazy long line crazy long line                      |
# |                                                                              |
# +------------------------------------------------------------------------------+

# what will give us that ^^^?:

# something like this could work...
# puts end_line
# puts empty_line
# arr.each { |x|
#   puts "| #{x} |"
# }
# puts empty_line
# puts end_line

# we have end_line and empty_line figured out from previous part of prompt. 

# but we need arr still...
# what does arr represent?

# an array of strings that are all equal and appropriately sized.
# what's the appropriate size?
# 80 columns or 80 characters
# oh wait, i have to add in the | character and the spaces on each end.
# so 80 - 4 = 76 

# so we have:
# a string that's too long

# we need to get:
# a collection of strings that are equal and appropriately sized
# and print each element of that collection on a separate line.





