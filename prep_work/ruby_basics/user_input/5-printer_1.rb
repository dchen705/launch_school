# Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.


num = 0
until num >= 3
puts "How many output lines do you want? Enter a number >>"
num = gets.chomp.to_i
if num < 3
  puts "That's not enough lines"
end
end

num.times do
  puts "Launch School is the best!"
end