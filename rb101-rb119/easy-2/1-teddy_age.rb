# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# sounds simple, use the rand method?



def display_name(name)
  if name == ''
    name = 'Teddy'
  end
  puts "#{name} is #{rand(20..200)} years old!"
end

puts "Please name a person"
name = gets.chomp

display_name(name)

 # I was trying to use default argument values but couldn't figure it out
 # weirdly, none of the student's solutions had one either
 # here i could also use .empty? to check 