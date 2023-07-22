# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

# reflex algo:
# components --
# for loop iteration by 2++
# puts
# ^ habit from C
# guess in ruby have ot use (..).each or (..).step(2)

(1..99).step(2) { |n| puts n}


# alternative:

# (1..99).each do |n|
#   if n.odd?
#     puts n
#   end
# end

# # (1..99).%(2) { |n| puts n }
# ^ same as 
# (1..99).step(2) { |n| puts n}