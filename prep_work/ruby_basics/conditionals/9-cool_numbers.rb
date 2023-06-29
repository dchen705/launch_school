# number = rand(10)

# if number = 5
#   puts '5 is a cool number!'
# else
#   puts 'Other numbers are cool too!'
# end

# Currently, "5 is a cool number!" is being printed every time the program is run. Fix the code so that "Other numbers are cool too!" gets a chance to be executed.

# ok, first clause if being printed 

# only because = is an assignment
# not an equality operator, so will
# evaluate to truthy.

number = rand(10)

if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end