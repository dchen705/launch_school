#  Modify your program so it prints an error message for any inputs that aren't y or n, and then asks you to try again. Keep asking for a response until you receive a valid y or n response. In addition, your program should allow both Y and N (uppercase) responses
input = nil
loop do
puts "Do you want me to print something? (y/n)?"
input = gets.chomp
if input.downcase == "y" || input.downcase == "n"
  break
end
puts "Invalid input! Please enter y or n"
end
puts "something" if input == "y"

# choice = nil
# loop do
#   puts '>> Do you want me to print something? (y/n)'
#   choice = gets.chomp.downcase
#   break if %w(y n).include?(choice)
#   puts '>> Invalid input! Please enter y or n'
# end
# puts 'something' if choice == 'y'

# Their solution ^ using .include method and an array literal, %w(y n)