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

# Refactored
class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @digits.size

    [*0..(@digits.size - length)].map { |start_idx| @digits[start_idx, length]}
  end
end

class Series
  def initialize(digits)
    @digits = digits.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @digits.size

    0.upto(@digits.size - length).map { |start_idx| @digits[start_idx, length]}
  end
end