# Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.


# repeat 5 times, ask for number and push to an array
# ask for 6th num
# search array for element equal to 6th number



which_num = %w(1st 2nd 3rd 4th 5th)
five_numbers = []

5.times do |n|
  puts "==> Enter the #{which_num[n]} number"
  this_num = gets.chomp.to_i
  five_numbers.push(this_num)
end

puts "==> Enter the last number"
last_number = gets.chomp.to_i
if five_numbers.include?(last_number)
  puts "The number #{last_number} appears in #{five_numbers}."
else
  puts "The number #{last_number} does not appear in #{five_numbers}."
end
