20:21

other student''s timeline: 
quietly reads
=> 2:00, says main thing is trying to make sense of last sentence of prompt
=> 2:41, now starts describing the 2 test cases in prompt
=> 4:35, starts writing a high level summary (which transforms into a high algo)
=> 5:50, "how to sum each side?"
  "make 2 separate arrays based on index"
=> 6:14 starts doing DS intermed pathway
  =>8:00 still doing DS pathway - think trying to come up w/ low algo
  self note: tricky part of implementation is choosing right tool, if you try array#slice, the issue is
  at split idx 0, can''t say i want elements at index -1 cuz that just goes to front. picking
  the #select over #slice makes easier.
=> 17:17 finished his pseudocode (still missing something fixable) and starts writing code
  (similar to me the low detail pseudocode writing was time-consuming and if i didn''t write it to be
  implementation-ready then when I code and circled back it would consume even more time)
  - main issue is just fluency which comes w/ experience/focused practice of taking the high algo and converting to pseudocode.
=> 24:00 still code implementing - cuz he''s filling in for the incomplete pseudocode
  - like not accounting for right side being empty
  - using reduce(:+) which returns nil for [] - need to fix.
This question a key part is recognizing to use SELECT.
one thing I can think about is categorizing the problem:
Is this a select, transform, iterate problem, etc..
this intuition is really just gained from doing diff problems.

my timeline
=> 1:22, finished reading prompt "think i understand"
=> 3:32, summarizing/writing out the input/output and rules/requirements, 
=> 5:42, writing out test cases
=> 8:35, DS intermed pathway + high algo summary complete, starting low lvl algo
=> 12:45, finished the low lvl algo -> exerted a bit to figure out #partition pseudocode
=> 19:52, wrote the code, had to overcome a small
thing didn''t consider in pseudocode, passed the test case, rest of time was just putting in test case manually.
# given - a list of integers
# return - integer representing an index in which array slice to left and right have equal sums (disincludes the index)
#   criteria: left and right sides are equal

# rules/requirements
#   - -1 returned if idx that meet criteria is found
#   - if say index at 0, left side is an empty Array

# [1, 2, 3, 4, 3, 2, 1] == 3
# [1, 100, 50, -51, 1, 1] == 1
# [1, 2, 3, 4, 5, 6] == -1
# [20, 10, 30, 10, 10, 15, 35] == 3
# [20, 10, -80, 10, 10, 15, 35] == 0
# [10, -80, 10, 10, 15, 35, 20] = 6
# [-1, -2, -3, -4, -3, -2, -1] = 3

# DS intermed pathway
# [1, 2, 3, 4, 3, 2, 1]
# #each, loop, -> iterate by index
# idx = 0
# right = []
# left = [2, 3, 4, 3, 2, 1]
# #partition assign left to elements w/ idx less than `idx`, etc..
# #sum

# high abstract summary
# iterate by index through the input array and slice from input array the left and right sides by index and check if there sums are equal, return that index if so, at end if none, return -1 by default
# low lvl algo
#   - given `num_list`
#   - for each index on `num_list`, set `split_idx`
#     - partition with index, `num_list` and `placement_idx` so that:
#       - `left_side` contains elements with `placement_idx` <= `split_idx`
#       - `right_side` contains elements with `placement_idx` > `split_idx`
#       - manually delete last element of left_side
#     - if sum of left_side and right_side are equal, return the split_idx

#   - return -1

def find_even_index(num_list)
  num_list.each_index do |split_idx|
    left_side, right_side = num_list.partition.with_index do |_, placement_idx|
      placement_idx <= split_idx
    end
    left_side.delete_at(-1)
    return split_idx if left_side.sum == right_side.sum
  end
  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3

p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3