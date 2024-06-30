# 25 minutes - straightforward, simple, a typical LS iteration question.

# Problem:
# Calculate Hamming distance
# number of differences at matching indices of 2 sequences of equal length

# Examples:
# Class DNA, DNA objects initialized with a string
# `hamming_distance` called on DNA object - original strand
# argument of ^ method is a string - other strand

# calculated by iteratively comparing until length of shorter strand

# Rules/Requirements
# - assume all string values are uppercase

# Data Structure:
# string -> Array (access to selection)?
# leave as string and iterate by index

# Algorithm
# - set index = 0
# - hamming_distance = 0
# - until original_strand[index].nil? || other_strand[index].nil?
#   hamming_distance += 1 if original_strand[index] != other_strand[index]
#   - index += 1
# - hamming_distance

class DNA
  attr_reader :original_strand

  def initialize(original_strand)
    @original_strand = original_strand
  end

  def hamming_distance(other_strand)
    index = 0
    hamming_distance = 0

    until original_strand[index].nil? || other_strand[index].nil?
      hamming_distance += 1 if original_strand[index] != other_strand[index]
      index += 1
    end

    hamming_distance
  end
end