~40 min for both, harder than practice probs 1-2 for sure.
I def struggled more than anticipated and I wasn''t able to articulate as well
becuz I was focused on solving prob.

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

given - String
return - string in which every multiple of 3 word''s every multiple of 2''s chars are upcased

rules/requirements
- same string or new string returned?

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

DS intermed pathway
'It is a long established fact that a reader will be distracted'


String#split -> word_list
['It', 'is', ... ]
  Array#each_index
    0, 1, 2, 3
    1, 2, 3
    nth = idx + 1
    word_list[idx] if nth is multiple of 3?
    upcase = false
    word_list[idx] = word[idx].each_char.map {upcase every other char, upcase = !upcase}.join
      'reader'




==>
'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'

high abstract summary
  low lvl algo
- convert string to list of words, then iterate by index, within each index, we need to check if that particular index is the nth element that''s multiple of 3 and if it is we need to mutate/set the element to the return value of a transformed array joined back into a string in which every other character gets upcased, at end we need to join the list of words back together
  - given `str`
  - assign `word_list` to new array of words from `str` delimited by blankspaces
  - iterate by index through `wordlist`, set `idx`
    - `nth` = idx + 1
    - if `nth` % 3 == 0
      upcase = true
      word_list[idx] = word_list[idx].each_char.map do |char|
        upcase = !upcase
        upcase? char.upcase : char
      end.join
  - join word_list


def to_weird_case(str)
  word_list = str.split
  word_list.each_index do |idx|
    nth = idx + 1
    if nth % 3 == 0
      upcase = true
      word_list[idx] = (word_list[idx].chars.map do |char|
        upcase = !upcase
        upcase ? char.upcase : char
      end).join
    end
  end
  word_list.join(' ')
end

when I did:
p word_list[idx].chars.map do |char|
        upcase = !upcase
        upcase ? char.upcase : char
      end
I ended up printing the enumerator for map
p method binds tighter to #map return value than
a do..end block so the block was not used

# similar variation
def to_weird_case(str)
  word_list = str.split
  word_list.each_with_index do |word, idx|
    nth = idx + 1
    next if nth % 3 != 0
    upcase = true
    weird_cased = word.each_char.map do |char|
      upcase = !upcase
      upcase ? char.upcase : char
    end.join
    word.replace(weird_cased)
  end
  word_list.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
  
  # Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

given - list of integers
return - the two pairs of numbers that are closest in value


# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

DS intermed pahtway

[5, 25, 15, 11, 20] 
idx 0 -> ... arr.size - 1( = 4), first_idx
[5, 25], [5, 15], []
  idx first_idx + 1 ->.... arr.size (5)

[[5, 25], [5, 15], []]. sort_by |first_num, second_num

asecnding order
by 
abs difference of first and second numbers

take min of sorted array


==> [15, 11]

algo
  - given `num_list`
  - get all pairs from `num_list`, assign to `pairs` initalized to []
    - iterate by index - (0)...arr.size - 1, set `first_idx`
      - iterate by index - (first_idx...arr.size), second `second_idx`
        - concat to `pairs` << [num_list[first_idx], num_list[second_idx]]
  - sort the pairs according to abs difference then get the minimum element of that sorted list (using sort_by)
      (first_num - second_num).abs

def closest_numbers(num_list)
  pairs = []
  (0...(num_list.size - 1)).each do |first_idx|
    (first_idx + 1...num_list.size).each do |second_idx|
      pairs << [num_list[first_idx], num_list[second_idx]]
    end
  end
  pairs.sort_by! do |first_num, second_num|
    (first_num - second_num).abs
  end
  pairs.first
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]


# ============================================================
14:30
Write a method that takes a string as an argument and returns
the character that occurs least often in the given string.
If there are multiple characters with the equal lowest number
of occurrences, then return the one that appears first in the
string. When counting characters, consider the uppercase and
lowercase version to be the same.

given - a string
return - the first letter in position that occurs the minimum/least amount of times in string.

rules/requirements
  - char is case-insensitive
  - include puctunctuation
Examples:

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

The tests above should print "true".



"Hello World" -> downcased
['h', 'e', ...] -> array#tally
# {'h' => 1, ...} -> hash#select {_, v} v == hash.keys.min -> smallest_occurences
# itertae downcased str again, char check included in smallest occurences return it


# => 'h'

high level algo
  low lvl algo
- we need a count of every uniq character
- select the lowest subset
- iterate by char through str - if includes in lowest subset then return char
  - given `str`
  - assign to 'char_count' then tally of downcased `str`
  - assign to `least_occuring_chars` = char_count.seelct in which the vaue of unique key is equal to lowest value of value arrays of `char_count`
  - iterate through str, by `char`
    - return char if char included in `least-occuring_chars`

def least_common_char(str)
  char_count = str.downcase.chars.tally
  least_occuring_chars = char_count.select do |_, occurences|
    occurences == char_count.values.min
  end.keys
  str.downcase.each_char { |char| return char if least_occuring_chars.include?(char)}
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'