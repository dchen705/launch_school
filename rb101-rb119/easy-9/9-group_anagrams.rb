# took me 31 min, yeah couldn't come up with a smarter way to do the iteration.
# feel like I rushed into algo without verifying what i saw - particularly verifying that
# input list only contained anagrams not just words
# grouping by shared criteria should have been signal to use a hash
# instead i used a nested array.

# Below you'll see me explaining multiple students alternative approaches
# I'll summarize them
# Then'll I'll implement each myself

# Given
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']
        
# Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
#(etc)


# - Initialize `anagram_list` to []
# - Iterate through `words` with `index`, set `word` as word of current iteration
#   - if `word` is found in flattened `anagram_list` - go to next word
#   - initialize `current_anagrams` = [`word`]
#   - iterate from next word in `words` to end of `words`, set `second_word`
#     - if `second_word` found in flalatend `anagram)list - go to next word
#     - compare `word` to `second_word - if anagram? then concatenate `second_word` to current_anagrams
#   - anagram_list << current_anagrams if size greater than 1
  
# helper `anagram?(word, second_word)`
# - convert each word to character of arrays and convert to a hash table of tallys of each character check if their the same



def anagram?(word, word2)
  word.chars.tally == word2.chars.tally
end

def print_anagrams(words)
  anagram_list = []
  words.each_with_index do |word, idx|
    next if anagram_list.flatten.include?(word)
    current_anagrams = [word]
    # iterate for word2
    words[idx + 1..-1].each do |word2|
      next if anagram_list.flatten.include?(word2)
      current_anagrams << word2 if anagram?(word, word2)
    end
    anagram_list << current_anagrams if current_anagrams.size > 1
  end
  anagram_list.each { |anagram_set| p anagram_set }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

print_anagrams(words)

# ans key raises awareness that prompt specified we assume input is all anagrams, so 
# no unique words.

# they iterated over each word, and gave each word a key by sorting the characters.
# so they found a way to "commonalize" criteria words that were anagrams of each other.

# this question raises many thoughts
# look at others solutions:

Example 1:
  # def is_anagram?(word_1, word_2)
  #   return false if word_1.length != word_2.length
  #   word_1.each_char.all? do |char|
  #     word_2.include?(char)
  #   end
  # end
  # ^ this wouldn't work for this test case:
  # p is_anagram?('aaabb', 'aabbb') #=> true
  
# a flaw of my algo is if we wanted to include dups of a word, then it would get
# skipped over, there'd be only 1 copy of each unique word in the final output

Example 2:
# def anagrams(list)
#   list.map do |key|
#     list.select do |word|
#       word.chars.all? { |char| key.include?(char) }
#     end
#   end.uniq
# end

^ this only passes the test case. one thing i noticed was test case wasn't very rigorous. 'papa' and 'pa' would be considered anagrams.' he transformed and selected based on words having the same letters. 

Example 3:
# def words(arr)
#   unique_arr = arr.uniq

#   unique_arr.each_with_object(result = Hash.new) do |item, hash|
#     sorted_word = item.chars.sort.join
#     hash[sorted_word] = arr.select { |word| word.chars.sort.join == sorted_word }
#   end

#   result.each_value { |val| p val }
# end

the key idea works the same in that you have to use a sorted character string to "key-ify" each word in the list.
He just made it slightly more efficient by:
  he iterates over each unique anagram character set
  he selects those words that have a key that match the unique anagram key being iterated over.
  
Example 4 (similar to ans key and ex3, just concating to the hash table instead.)
def print_anagrams(words_array)
  unique_character_sets = words_array.map do |word|
    word.chars.sort.join
  end.uniq

  anagrams = {}
  unique_character_sets.each do |set|
    anagrams[set] = []
  end

  words_array.each do |word|
    anagrams[word.chars.sort.join] << word
  end

  anagrams.values.each do |anagram_set|
    p anagram_set
  end
end

Example 5:
words.map do |outer_word|
  words.select do |inner_word|
    inner_word if inner_word.chars.difference(outer_word.chars) == [] 
  end.sort
end.uniq.each { |arr| p arr }

# what's prominently common between solutions is the aspect of using two pointers
# to compare by some grouping/selection criteria / sharing key value

Shared Common Problems

Grouping Criteria
# ppl differ in what they use as grouping criteria
  # tally of each character
  # sorted string (#chars.sort)
  # (DOESN't WORK in all cases) word1.chars.all? (word2.include?(char))
  # word.chars.difference(word2.chars)
    Array#difference
    # [ 1, 1, 2, 2, 3, 3, 4, 5 ].difference([ 1, 2, 4 ])     #=> [ 3, 3, 5 ]
    # so doesn't consider all cases - like #difference can't distinguish ['m', 'a']
    # from ['m', 'a', 'm', 'a']
    
How to construct a container to hold each anagram "group"
  # using group_by
  # double layer iteration, check group criteria, concat to holder
  # transform into a selected criteria, uniq
  # iterate over unique key set, within iteration, select from original list
  # until loop with partition

How to double point (an actual alternative to double point is iterate over a unique key set) <- double pointing is actually unnessary/limiting belief
# 2 pointers for comparison of 2 words
  # double layer iteration 
    # word1 to word2
      # element by element (or index by index)
  #words.select within #words.map then #uniq
  

Example 6 (finally lots of students used Enum#group_by)
def anagrams(array)
  groups = array.group_by { |word| word.chars.sort.join }.values
  groups.each {|x| p x.sort}
end

What Enum#group_by returns
# groups = array.group_by { |word| word.chars.sort.join } #=>
# {"demo"=>["demo", "dome", "mode"], "enno"=>["none", "neon"], "deit"=>["tied", "diet", "edit", "tide"], "eilv"=>["evil", "live", "veil", "vile"], "flow"=>["fowl", "wolf", "flow"]}

Example 7 (at first didn''t understand, but realized he just did the same thing i want)
def group_anagrams(words_arr)
  char_hash_arr = words_arr.map do |word|
    empty_hash = Hash.new(0)
    [word, word.chars.each_with_object(empty_hash) { |char, hash| hash[char] += 1 }]
  end

  char_hash_arr = char_hash_arr.group_by { |word, hash| hash }.values
  char_hash_arr.map { |arr| arr.map { |subarr| subarr[0] } }
end

^ he''s transforming each word into a word with its keys, the key is a tally like mine, this is manually doing do tally method (pretty concise)
then using group by - still not sure what group by does...
ok now i know group_by returns a hash where key is return value of block of block
and value is array of elements partitioned from calling enumerator that have block return value equal to key value.

the naming of `word` in group_by block is poor choice. as the obj `word` references is actually an array [word, character count hash table]

he could also group_by called on word with #with_index, then make return value equal to
char_hash[idx][1]
then he wouldn''t need to transform like so:

def group_anagrams(words_arr)
  char_hash_arr = words_arr.map do |word|
    empty_hash = Hash.new(0)
    [word, word.chars.each_with_object(empty_hash) { |char, hash| hash[char] += 1 }]
  end

  anagram_groups = words_arr.group_by.with_index { |word, idx| char_hash_arr[idx][1] }.values
end

Example 8: (using until loop and #partition, ugh this is what i shoulda come up with)
def anagrams?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

final_array = []
until words.empty?
  test_word = words.first
  subarray, words = words.partition{|element| anagrams?(test_word, element)}
  final_array << subarray.inspect
end

puts final_array

Another student who iterated like me but used a different form of grouping - which was by 
# thought interesting she used a for loop for the nested iteration
# som variation of word1.chars.all? (word2.include?(char)) for grouping
def anagrams(word_array)
  anagrams = []
  word_array.each_with_index do |word, index|
    subarray = []
    if !anagrams.flatten.include?(word)
      subarray << word
      for other_word in word_array[index + 1..-1] # every word in the remaining part of the array
        if other_word.chars.all? { |char| word.include?(char)}
          subarray << other_word
        end
      end
      anagrams << subarray
    end
  end
  anagrams.each do |group|
    p group.sort
  end
end

# High Level Approaches
# - Group by anagram key (either a character count tally or a sorted string)
#   - use #group_by? OR
#   - use map, select then uniq OR
#   - iterate through unique key and select from words

# - Loop through each word, popping off from words and allocating to appropriate group
#   - concatenate and #shift manually
#   - use partition
  
# - double iteration to check if two words are anagrams of each other (my og solution)

def print_anagrams(word_list)
  word_list.group_by do |word|
    word.each_char.with_object(Hash.new(0)) do |char, tally|
      tally[char] += 1
    end
  end.values.each { |set| p set}
end

def print_anagrams(word_list)
  word_list.map do |word_to_transform|
    word_list.select do |word_to_select|
      word_to_transform.chars.sort == word_to_select.chars.sort
    end
  end.uniq.each { |set| p set }
end

def print_anagrams(word_list)
  unique_anagram_keys = word_list.map do |word|
    word.chars.tally
  end.uniq

  unique_anagram_keys.map do |tally|
    word_list.select do |word|
      word.chars.tally == tally
    end
  end.each { |set| p set }

end

def print_anagrams(word_list)
  dup_word_list = word_list.dup

  anagram_groups = Hash.new([])

  until dup_word_list.empty?
    current_word = dup_word_list.shift
    if anagram_groups.key?(current_word.chars.sort)
      anagram_groups[current_word.chars.sort] << current_word
    else
      anagram_groups[current_word.chars.sort] = [current_word]
    end
  end
  
  anagram_groups.values.each {|set| p set}
end

def anagram?(word, word2)
  word.chars.sort == word2.chars.sort
end

def print_anagrams(word_list)
  dup_word_list = word_list.dup
  anagram_groups = []
  until dup_word_list.empty?
    test_word = dup_word_list[0]
    anagram_set, dup_word_list = dup_word_list.partition do |word|
      anagram?(test_word, word)
    end
    anagram_groups << anagram_set
  end
  anagram_groups.each {|set| p set}
end

print_anagrams(words)
