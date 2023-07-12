# The following code throws an error. Find out what is wrong and think about how you would fix it.

# colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
# things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

# colors.shuffle!
# things.shuffle!

# i = 0
# loop do
#   break if i > colors.length

#   if i == 0
#     puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
#   else
#     puts 'And a ' + colors[i] + ' ' + things[i] + '.'
#   end

#   i += 1
# end

# # I think what's happening is that in the break if clause
# # arrays start at 0 index, colors[colors.length] would actually be not initialized because the last element of colors[]
# is actually colors[colors.length-1]
# # i starts at 0, matching starting point of the array[0]
# then the break clause won't stop the loop when i = colors.length
# which will later cause the puts clause containing the colors[i]
# to check for a element not initialized
# yup, error was implicit conversion of nil to string...nil being that colors[colors.length]
# solution is to change break if to i == colors.length.

# colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
# things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

# colors.shuffle!
# things.shuffle!

# i = 0
# loop do
#   break if i == colors.length

#   if i == 0
#     puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
#   else
#     puts 'And a ' + colors[i] + ' ' + things[i] + '.'
#   end

#   i += 1
# end

# #
# I have a dark blue sofa.And a turquoise surf board.And a yellow pen.
# And a black training mat.
# And a silver notebook.
# And a red coffee mug.
# And a green mouse pad.
# 8-colorful_things.rb:45:in `+': no implicit conversion of nil into String (TypeError)

#     puts 'And a ' + colors[i] + ' ' + things[i] + '.'

# ^ why did it print this instead of red pen...
# oh it got shuffled, that's why.
# i get why it's still returning nil, because
# things only has 7 elements vs colors having 9 elements.
# so i have to change to break if i == things.length

colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i == things.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end