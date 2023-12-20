Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

Data Structure
  (IN) hash { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 } ->
  [
    A:
    [32, 30, etc...] -> 10
    B:
    {"Eddie" => 10, "Marilyn" => 22} -> 10
    C:
    `min` = 32
    30 > 32 ? 30 : 32
  ]
  (OUT) integer

Algorithm
  Lang Tool
      A
    - Hash#values -> Array#min
      B
    - Hash#sort_by -> Hash#first.value
      C1
    - Hash#reduce -> Array#[1]
      C2
    - Hash#each w/ outer min var
    
A
# p ages.values.min
B
# p ages.sort_by { |k, v| v}.first[1]
C1
# p (ages.reduce(ages.first[1]) do |min, (k, v)|
#   v < min ? v : min
# end)
C2
# min = ages.first[1]
# ages.each { |k, v| min = v < min ? v : min}
# p min

^^ all worked.
