# 1:27 hh:mm to complete, like my end solution, didn't need much refactoring
# but the test cases carried me, don't think can implement off just knowledge

# # mental model of linked list
# let A, B, C be elements pushed in that order
# [] < A < B, C
# [A]
# [A < B], basically when pushing to a linked list, the `next` of pushed
# element points to last element pushed into list
# [A < B < C], where < kinda denotes the next pointer

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail? # first pushed element that's not pointing
    self.next.nil?
  end
end

class SimpleLinkedList
  attr_reader :elements

  def initialize(*data) # can't set default value on splat parameter
    @elements = []
    data&.reverse_each do |datum|
      @elements << Element.new(datum, @elements.last)
    end
  end

  def size
    elements.size
  end

  def empty?
    elements.empty?
  end

  def push(value)
    elements << Element.new(value, elements.last)
  end

  def peek # returns datum of head
    head&.datum # safe navigation &. - if head.nil? == true,
    # short circuits the boolean & and doesn't call the method
  end

  def head
    elements.last
  end

  def pop
    elements.pop.datum
  end

  def self.from_a(array = [])
    new(*array)
  end

  def to_a
    elements.reverse_each.map(&:datum)
  end

  def reverse
    SimpleLinkedList.new(*to_a.reverse)
  end
end

# kinda wanna refactor, #reverse to make more readable
# yup, changed from
# self.class.from_a(to_a.reverse)
# to
# SimpleLinkedList.new(*to_a.reverse)
