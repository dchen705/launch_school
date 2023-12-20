# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

Data Structure
(IN) ->
[
  A:
  [32, 30, etc...]
  
  B:
  32 -> 62 -> etc...
  ]
(OUT)
Algorithm
Lang Tools
  Tier 1
    Hash#values, Array#sum
    Hash#reduce
  
  Tier 2
    Hash#each_with_object Integers are nonmutable, bad idea
    
ages.values.sum
ages.reduce(0) { |sum, (_, value)| sum + value }
  
# Ans key
  # - #each with outer accumulator variable
  # - #reduce(:+)
  # - counter/break loop w/ accumulator var