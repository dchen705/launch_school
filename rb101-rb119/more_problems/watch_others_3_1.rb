# took 33 min, but spent 13:30 to load problem, brainstorm, finally settle for
# brute force gen all subsequences
# trivial aside, vid helped me see why #map has alias #collect.
# example: we `collect` sum of each sequence in `subsequences` array
# Given an array of integers

# Return : max sum of any possible continguous sequence within given Array

# [] => 0
# [-1, -2] => 0
# [3, 4, 5] => 12

# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# Thoughts
#   start at first num 

#   remove leading negative numbers in array

#   look for the longest sequence of positive numbers

#   find all possible sequences (brute force)

#   benchmark like the average of the array - to 

# - Initialize - max_sum
# - Intialize - max_sequence
# - Iterate through `sequence`
#   - `next` the `start_num` if less than 1
#   - Iteratively slice a `subsequence`


# High Level Approach (brute force iteartion)
#   - generate_subsequences
#   - transform subsequences into `sums`
#   - return the `max` of sums


# Approach
#   'generate_subsequences' : Helper

#     - given `sequence`
#     - initialize  `subsequences`
#     - iterate over 0..`size`, set `start_idx`
#       `next` if sequence[starting_idx] < 1
#       iterate from (start_idx + 1..size), set 'end_idx'
#       subsequnce << current subsequence

#     - return subsequences

#   'max_sequence'
#     call 'generate_subsequences', assign return to subsequences
#     - transform subsequences to their sums
#     - get the max

def generate_subsequences(sequence)
  subsequences = []
  size = sequence.size
  (0..(size - 1)).each do |start_idx|
    first_num = sequence[start_idx]
    if first_num < 1
      next
    end

    ((start_idx + 1)..(size - 1)).each do |end_idx|
      subsequences << sequence[start_idx..end_idx]
    end

  end
  subsequences
end

def max_sequence(sequence)
  return 0 if sequence.empty? || sequence.all? {|num| num < 0}
  return sequence.sum if sequence.all? { |num| num > 0}
  subsequences = generate_subsequences(sequence)
  subsequences.map do |subsequence|
    subsequence.sum
  end.max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12