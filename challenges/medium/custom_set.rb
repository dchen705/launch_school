class CustomSet
  def initialize(values = [])
    @values = values.uniq
  end

  def empty?
    values.empty?
  end

  def contains?(value)
    values.include?(value)
  end

  def subset?(full_set)
    values.all? { |value| full_set.include?(value) }
  end

  def disjoint?(other_set)
    values.none? { |value| other_set.include?(value) }
  end

  def eql?(other_set)
    values.sort == other_set.values.sort
  end

  alias == eql?

  def add(value)
    values.include?(value) ? self : CustomSet.new(values << value)
  end

  def intersection(other_set)
    CustomSet.new(values.intersection(other_set.values))
  end

  def difference(other_set)
    CustomSet.new(values.difference(other_set.values))
  end

  def union(other_set)
    CustomSet.new((values + other_set.values).uniq)
  end

  protected

  attr_reader :values

  def include?(value)
    values.include?(value)
  end
end
