ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# remove people with age 100 and greater.

# Data Structure
#   (IN) ->
#   [
#     A #deleteif
    
#     B
#     ["Grandpa"] -> array of keys with values greater than 100
#     ]
#   (OUT)
# Lang Tools
#   - Hash#deleteif
  
#   - Hash#select -> Hash#keys -> Array#each {Hash#delete}
#     - Hash#reject (variant)
    
#   - Hash#each with accumulator variable (array holding keys w/ value greater than 100
#     Hash#delete
    
#   - Convert to array -> then .... nah
  
A:
ages.delete_if { |k, v| v >= 100 }
# ^ it returns the calling hash with pairs deleted, not the deleted pairs

B:
ages.select { |k, v| v >= 100}.keys.each { |key| ages.delete(key) }
ages

# Ans Key

# Hash#keep_if
# Hash#select!

p ages.reject! { |k, v| v >= 100 }
p ages.select! { |k, v| v < 100 }