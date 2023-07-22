# Build a program that displays when the user will retire and how many years she has to work till retirement.

require 'date'

print("What is your age? ")
current_age = gets.chomp.to_i

print("At what age would you like to retire? ")
desired_retire_age = gets.chomp.to_i

years_to_retire = desired_retire_age - current_age

current_year = Date.today.year

puts("It's #{current_year}. You will retire in #{current_year + years_to_retire}.")
puts("You have only #{years_to_retire} years of work to go!")

# had to figure out how to look up today's year
# checked on Date class, Date> today and Date > year

# learned that date isn't in default ruby and i had to import it with require
# meanwhile there's a class called Time. Time.now.year