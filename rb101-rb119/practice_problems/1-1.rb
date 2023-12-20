# Turn this array into a hash where the names are the keys and the values are the positions in the array.


flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# { "Fred" => 0, "Barney" => 1, etc...}



Data Structure
(IN) array ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"] ->
[
  A:
    "Fred", 0
    "Barney", 1
    ...
    
    OR
    
  B:
    [['Fred', 0], ['Barney', 1], etc...]
  
  ]
(OUT) hash{ "Fred" => 0, "Barney" => 1, etc...}

Algorithm

  ~ Components w/ Lang Tools
      Iteration
        - counter/break loop
        - built-in methods
      Type conversion
        - Array#to_h


  Approach
    A: Iteratively build new hash with counter and Array#[counter]
      - manual counter/break/loop
      - built-in methods
    B: Transform `input_arr` w/ elements as 2 item arrys [name, idx], convert to hash
    
  A1: 
   - set `idx_incrementer` == 0
   - set `return_arr` = {}
   - loop until idx_incrementer >= size of `flinstones`
    - flintstones[idx_incrementer] = idx_incrementer
    - +1 on `idx_incremneter`
  A2
  - method call - loop over each index of flintstones, chain method call to
  include return obj parameter, set `idx` to index iterated over, set `return_hash` to empty array
    - within given iterative block:
      - set return_hash[flintstone[idx]] == idx
    - method implicity returns return_hash
  B1
  - set `name_and_idx_arr` to return of method call - iterate over index and
  convert to enum, set `name` and `idx` to idx iterated over, chain method call to enum
    - within call:
      - returns transformed arr, each element is return of iterative block:
        - within block: 
          - [name, idx]
    
def arr_to_hash(arr)
  idx_incrementer = 0
  return_arr = {}
  until idx_incrementer >= arr.size
  return_arr[arr[idx_incrementer]] = idx_incrementer
  idx_incrementer += 1
  end
end

def arr_to_hash(arr)
  return_obj = arr.each_index.with_object({}) do |idx, return_obj|
    return_obj[arr[idx]] = idx
  end
end

def arr_to_hash(arr)
  (arr.each_with_index.map do |name, idx|
    [name, idx]
  end).to_h
end



Refining PEDAC
  - "Thoughts" is for miscellaneous/things you struggle to categorize
  - Under Algorithm, put "Possible Logical Components w/ Lang Tools"
  - Trying to come up with naming of each high level approach, then name for section where I list each approach
    - So I can cross-pollinate in DS section - organize by algo name then share the DS pathway
  - before implementation details, we want to gather as much relevant info as possible
  during high level algo/data structure so we can discuss differences and tradeoffs
  to pick the best approach.
  
  I feel like writing out too much detail in pseudocode is too time-consuming, like I don't
  need to write out how the methods work / exact mechanism which eats time.
  
  