28 minutes
the entire PEDAC only took 19 minutes which was great
but I spent like 9-10 minutes debugging
due to issues with range iteration, combined with negative indexes
so this exercise exposed my weakness in debugging.

given - array 
return - the same array sorted using bubble sort

rules/requirements
- assume at least 2 items in Array
- works with strings too (not just integers)

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

DS intermed pathway
[6, 2, 7, 1, 4]
  big loop - iterate small loop, if reaches break out
    small loop resets if any swap occurs

  big loop
    `swap?` = false

  small loop implementation
    `left` 0..-2 (by index reference)
    `right` 1..-1 (left_idx + 1)
      
    arr[0], arr[1] = arr[1], arr[0] if arr[0] > arr[1]
  if swap occurs, swap? = true

  break unless swap?

low lvl algo
- given `arr`
- loop
    set `swap?` to false
    iterate from (0..-2), set `left_idx`
      `right_idx` = `left_idx` + 1
      if arr[left_idx] > arr[right_idx]
        arr[left], arr[right] = arr[right], arr[left] if arr[left] > arr[right]
        swap? = true
    break unless `swap?` is true
- return `arr`

def bubble_sort!(arr)
  loop do
    swap = false
    (0...(arr.size - 1)).reverse_each do |left_idx|
      right_idx = left_idx + 1
      if arr[left_idx] > arr[right_idx]
        arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
        swap = true
      end
    end
    return arr unless swap
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

My debugging issue:

def bubble_sort!(arr)
  loop do
    swap = false
    (0..-2).each do |left_idx|
      right_idx = left_idx + 1
      if arr[left_idx] > arr[right_idx]
        arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
        swap = true
      end
    end
    return arr unless swap
  end
end

# ^ my first version which didn't run the iteration loop - eventually realized I used an invalid range
# going from 0 to -2

def bubble_sort!(arr)
  loop do
    swap = false
    (-2..0).reverse_each do |left_idx|
      right_idx = left_idx + 1
      if arr[left_idx] > arr[right_idx]
        arr[left_idx], arr[right_idx] = arr[right_idx], arr[left_idx]
        swap = true
      end
    end
    return arr unless swap
  end
end

# Then I created an infinite loop from ^.
# Why?
# I noticed swap was always true...
# the issue was I was assign right_idx to left_idx. but left_idx was changing from 0 to -2
# Look
(-2..0).reverse_each
left_idx: 0, -1, -2
right_idx: 1, 0, -1

the iteration was forcing arr[left_idx] > arr[right_idx] when left_idx was -1 and right_idx was 0,
so in a sorted array this is always true, so swap always true