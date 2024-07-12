# felt like once I understood high level, can make minor corrections as I went through test cases incrementally
# such as quickly adding in nil clauses to prevent nomethod errors and clarifying #pop returns head datum not head element itself
create a simple linked list class
  - construct
    given: elements

  - reverse

  - to_linked_list from array

  - to_arr from linked list

rules/requirements
  - every element in linked list contains element itself and a next pointer to the next element (except the end i assume)


Test Cases / Examples

illuminating testcase
  list.push(1)
  list.push(2)
  assert_equal 2, list.size
  assert_equal 2, list.head.datum
  assert_equal 1, list.head.next.datum
    ^ LIFO
    within the list
    1) Element(1) [head]
    2) Element(2) [head, Element(1)] <- Element1[1] [tail]
      last in element is the head, the first element (at bottom of stack) pushed in is the tail, and has no
      next pointer



DS
brainstorming:
  possible structure for linked list?
  [[a,b], [b, c]]

  becuz 2 classes
  linked list represented as [] << Element.new?

  Array of Elements to represent linked list
  SimpleLinkedList#push(head, tail)

  so we work from leftmost arg to rightmost
  Array#push
  tail [element1, element2] head

  then

  Array#pop




Algo
  Outline
    `Element` class

      - constructor(data, next_element) - accepts 2 args, leftmost is the data each subsequent arg is the next element

      - datum
        returns the data of that element

      - next
        returns next element (element object)

      - tail?
        checks that elmenet is not in middle, on one of ends, (the last element i think that doens''t have a next elmeent)

    `SimpleLinkedList` class

      `constructor` - given optional value
        - assigns value to some DS that represents state of this linked list

      `size`
        - returns the size of the linked list

      `push`(value) - pushes some value likely onto DS of linked list as an Elemenet object (note value is not Element obj but the datum of the Element object)
        - push some instantiation of Element consisting of value
        - the last element pushed has no `tail`

      `peek` - no args, seems to return a value from the list, perhaps from the end? yes, last elmeent pushed to it

      `head`
        - returns the Element obj last pushed to the linkedlist

      'pop'
        - removes last element pushed in

      `from_a`(array)
        - accepts both empty array and nil
        - returns linked list in which leftmost value of array (idx=0) is the head of linkedlist

      `to_a`()
        - returns simple linked list - to an array [head..tail]

      `reverse`
        - caller `linked_list` has an [a, b, c] (head) where a, b, c are elements, c is the head
        returns `reverse_linkedlist` has [c, b, a] (head) where a is the head

Following test cases, our roadmap:
- build the element class and its functions (independent)
- build the simple linked list and its key data structure and push functionality
- create the array to and from conversion functionality
- create the reverse linked list functionality

Procedural logic flow:
