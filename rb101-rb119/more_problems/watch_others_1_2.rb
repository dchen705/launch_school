# Given - list of strings
#   - note: strings only contain lowercase letters (no spacs, puncutation)
# Return - new list containing characters present in all strings of input String
#   note: duplicates are included, so if there's 2 'c's in every string of input, then include ['c', 'c'] in output Array

# p common_chars(['bella', 'label', 'roller']) - ['e', 'l', 'l']
# p common_chars(['cool', 'look', 'cook']) - ['e', 'l', 'l']

# # to keep track of duplicates, we can take out characters from the strings that we're checking

# we should also remove letters that aren't shared from each string.

# we don't need check every letter, just every unique letter

# count how many of each letter in each string, remove all occurences of that letter if not all strings have a count of at least 1
# if there are at least 1 in each string, take the smallest count and concatenate to return array amount of times of smallest count, remove all occurences of that letter from that string.

#   ^ we can leave the strings unmodified if 

#   Iterate over all unique character that appear in any given string of the input Array, set `char` as character being iterated over
#     - Transform each list of strings into their respective counts of that `char`, assign to `char_counts`
#     - # if all `counts` in `char_count` are 1 or greater, then (uncessary, if we multiply by minimum count and that is 0, won't concat any)
#       - find the `min_count` and concatentate `char` to return array `min_count times`

def common_chars(str_list)
  common_chars_list = []
  common_chars = str_list.join.split(//).uniq


  common_chars.each do |char|
    char_count = str_list.map do |str|
      str.count(char)
    end
    common_chars_list << [char] * char_count.min
  end

  common_chars_list.flatten
end

p common_chars(['bella', 'label', 'roller']) # - ['e', 'l', 'l']
p common_chars(['cool', 'look', 'cook']) # - ['e', 'l', 'l']
p common_chars(['hello', 'goodbye', 'booya', 'random'])
p common_chars(['aaabbbc', 'dddeee', 'fffgg', 'xyzzzzz'])

# I had two small probs at end:
# one was I was returning
# ['ll'] instead of ['l', 'l']
# if fixed this by doing [char] * count not char * count and then flattening the end list

# Another prob:
# getting '' empty strings inside my list
# so I changed split('') to split(//) -> learn the difference

# I finished between 20 to 25 minutes, felt weird becaue I jumped straight to algoirthm.

# watching my vid, there's some notable moments/observations:
  - my end algo deviated from what I initially came up with
    so an argument against initially creating a beautiful pedastal (in form of a pretty template)
    to lay my initial thoughts... in actuality - I have to be open to changing my mind later...
    and the first thought may be trashed later on.
    ^ this is diff from my early day strat of laying out my template, going in a certain
    order of process rigidly, laying out rigid rules...
    in fact, holding on to certain implementation ideas and formalizing them by putting them
    on an "official algorithm section" seemd to hold me back, as it made me feel more
    reluctant with removing it.
    instead I just info dumped all my ideas, spent very little focus on formatting and 
    organizing my thoughts, and this let me focus on coming up with idea, then when
    i felt like I had a good overall algo, then I wrote it out more formally.
  - Related to ^, I had multiple lightbulb moments:
    one of most important was thinking in terms of count
    ^ and what helped me think of that was another lightbulb to just get the unique letters first
    
  - once I wrote a high level approach, I used irb as a way to visualize and test-run
  my algo very quickly
    - this made me think about how to implement (what methods to pick, etc...)
    - also very useful for visualization
    
# what's very scary of my solution above was that I was dependent on lightbulb moments

    
    
# refactoring phase
# I should choose better name - instead of `common_chars` should be `uniq_chars`

# also figure out why #split('') caused those empty strings in the outputs


# Other student:
# his idea was just to iterate through one string element (arbitrarily first or last with #shift/#pop)
# I was thinking - what about iterating over the other string elements?
# but the presumption i missed is because we're concerned only with shared characters,
# we really only need to iterate over 1 string becuz any characters not in that 
# arbitrary 1 string won't be considered a shared string.

# he ran into problem where he had to copy the input array, so he wouldn't mutate it
# but issue was that cloning array would make a shallow copy, the elements would be shared
# TA guided solution was to reassign the parameter designed method var to the map return value,
# a transformed array of copies of each string element