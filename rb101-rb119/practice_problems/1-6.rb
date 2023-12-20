2:00 

# Write code that changes the array below so that all of the names are shortened to just the first three characters. Do not create a new array.

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Algorithm

#   High Level
#     - Iteratively Transform the Array
#       - Iterative method
#       - manual loop

    
p flintstones.map! { |name| name[0..2]}
