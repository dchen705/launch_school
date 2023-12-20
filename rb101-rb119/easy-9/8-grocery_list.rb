# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# given: 1 array of 2 element inner arrays - [fruit_type, quantity]
# return: new array of fruit

# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

# 2d arrays:
# ["apples"], 3

# hsh form 
# ["apples" => 3]

# convert input to hsh
# Iterate by the quantity of the hash value, `quantity`
#   for each `time`, concatenate the corresponding hash value

# transform each inner array then flatten it

# def buy_fruit(fruit_n_quantity)
#   fruit_n_quantity.map do |fruit, quantity|
#     [fruit] * quantity
#   end.flatten
# end

def buy_fruit(fruit_n_quantity)
  fruit_n_quantity.to_h.each.with_object([]) do |(fruit, quantity), arr|
    quantity.times { arr << fruit }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
  
  # Turning to hash was unnessary:
  # def buy_fruit(grocery_list)
#   grocery_list.each_with_object([]) do |fruit_qty, fruits|
#     fruit, quantity = fruit_qty
#     quantity.times { fruits << fruit }
#   end
# end

# def buy_fruit(arr)
#   arr.map { |fruit, quantity| Array.new(quantity, fruit) }.flatten
# end