# 39.5 min to complete

# 18 min to read through test cases

# conceptually easiest out of mediums, mostly just copy pasting array/enumerable methods and making sure no dups
custom set type

rules/requirements
- assume only numbers as elements
- each element is unique in this data structure


clarifying questions:
- how to handle non-numbers?
  throw an error?, or assume all inputs are numbers
- what type of numbers will it accept?
  floats, only integers?

Test cases / Examples

`CustomSet` class
  `constructor` - optional argument
    - data format of argument is an array ie: [1]
    - removes the duplicate of arg before adding to state @set

  `empty?` - check if empty - need an attribute to represent state of CustomSet, call it `set` or @set

  `contains?` - accepts 1 argument
    - check if @set includes value equal to the argument

  `subset?` - 1 argument, `full_set`
    - return boolean if all elements in caller set is in full_set

  `disjoint?` - 1 argument, `other_set`
    - return true boolean if no elemnets in either caller or other set match

  `eql?` - 1 argument, `other_set` (slightly harder)
  - return true if both sets elements match, ordering doesn''t matter

  `add` - 1 argument
  - will ignore if arg is a dup

  `intersection` - 1 arg, `other_set`
  - return new set with elements that present in both sets
    - so empty set returned if no matches

  `difference` - 1 arg, `subtracted_set`
  - return new set with elements of caller minus elements of subtracted_set that are present in both sets

  `union` - 1 arg, other set
  - returns new set, with elements of both sets joined, no dups














DS
array? - copy methods from this core library class
