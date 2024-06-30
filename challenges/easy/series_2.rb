# frozen_string_literal: true

# class
class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @digits.size

    num_series = []
    start_idx = 0
    end_idx = length - 1

    while end_idx < @digits.size
      num_series << @digits[start_idx..end_idx]
      start_idx += 1
      end_idx += 1
    end
    num_series
  end
end

# Iteration -> change what iterate over (start idx only)
  # perhaps slice by length (only 1 pointer needed)
  # perhaps transform instead of concat

  # if last index is 4, length is 4,
  # iterate up to 1

  # if last index is 4, length is 3
  # iterate up to 2

  # if last index is 4, length is 2
  # iterate up to 3

  # inferred relationship:
  # last start idx == size of arr minus length

  class Series
    def initialize(digits)
      @digits = digits.chars.map(&:to_i)
    end

    def slices(length)
      raise ArgumentError if length > @digits.size

      [*0..(@digits.size - length)].map { |start_idx| @digits[start_idx, length]}
    end
  end