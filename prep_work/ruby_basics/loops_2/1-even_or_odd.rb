count = 1
even_odd = ""

loop do
  even_odd = "odd!" if count.odd?
  even_odd = "even!" if count.even?
  puts "#{count} is #{even_odd}"
  count += 1
  break if count == 6
end

# Discussion:
# Their solution

# count = 1

# loop do
#   if count.even?
#     puts "#{count} is even!"
#   else
#     puts "#{count} is odd!"
#   end

#   break if count == 5
#   count += 1
# end

# I didn't need to assign a new variable for even/odd, could have just
# did the even/odd as a string in the if else loop.