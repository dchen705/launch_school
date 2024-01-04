2 hours - didn''t pass last test case
passed it after another 20 ish minutes
go over why so hard.
what helped reduce complexity was:
1 - running algo through a test case data structure by data structure
2 - rewriting pseudocode rather than code, adjusting at high level
3 - somtimes debugging with binding.pry or prints
# input - list of all strings or list of all integers
# output - sorted list using merge sort algo

# rules/requirements
#   - 1 data type in list only: string or integers
#   - recursion 
#     base case: only 1 element in Array


# merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# merge_sort([5, 3]) == [3, 5]
# merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# ==top ()

# ==bottom (lvl 1 - main)

# [9, 5, 7, 1] -> # lvl 1
# [[9, 5], [7, 1]] -> #lvl 2
# [[[9], [5]], [[7], [1]]]

# [[[9], [5]], [[7], [1]]] ->
# [[5, 9], [1, 7]] -> # lvl 2 -> 
# [1, 5, 7, 9] -> # lvl 1 -> 2 calls

# Thoughts
# odd and even numbered arrays have sightly diff cutoffs

# for the actual sorting, we need 2 pointers, so let''s use each to iterate through one array, and keep counter for 2nd array

# High level approach
#   Low lvl algo
# - base case is if the input array is size 1
#   return the single element array
# - recursively call `merge_sort` separately on 2 halfs of the inputted array and assign the returns to sorted left and sorted right
#   - left half arg is arr[0, (arr.size / 2).ceil]
#   - right half arg is [(arr.size / 2).ceil, arr.size / 2]
# - sort the left and right halfs
#   - initialize return arr = []
#   - initialize `right_half_idx` == 0
#   - iterate by element left half with idx, set `left_half_value`
#     right_half_value = right_half[right_half_idx]
#     if right_half_value is nil, 
#       concat left_half(idx to size of left half - 1)
#       break
#     if left_half_value <= right_half_value
#       concat left_half_value to return_arr
#     else
#       concat right_half_value to return_arr
#     right_half_idx += 1
#   - if right_half idx less than right half size - 1
#       concat to return_arr - right half[right half idx..-1]
# - return the return half


# left half - [9]
# right half - [8]
# right value = 8
# left value = 9

def merge_sort(arr)
  return arr if arr.size == 1
  left_half = merge_sort((arr.slice!(0, (arr.size / 2.0).ceil)))
  right_half = merge_sort(arr)
  
  
  return_arr = []
  rh_idx = 0

  left_half.each_with_index do |lh_value, lh_idx|
    rh_value = right_half[rh_idx]
    if rh_value.nil? || lh_value <= rh_value
      return_arr << lh_value
      return_arr << right_half[rh_idx..-1] if lh_idx >= left_half.size - 1
    else 
      until rh_idx >= right_half.size
        break if lh_value <= rh_value
        return_arr << rh_value
        rh_idx += 1
        rh_value = right_half[rh_idx]
      end
      return_arr << lh_value
    end
  end

  p return_arr.flatten

  # - intialize rh_idx to 0
  # # iterate by element left half, set lh_value
  #   - rh_value == right_half[rh_idx]
  #   - if lh_value <= rh_value
  #     << lh_value
  #   - else
  #     - loop 
  #     - rh_value = 
  #       - break if lf_h value < rh value
  #       - << rh_value
  #       - rh_idx += 1
  #       - if rh_idx == right half size
  #           << left half[lh idx to -1]
  #           break

  
  # left_half.each_with_index do |lh_value, lh_idx|
  #   rh_value = right_half[rh_idx]
  #   if lh_value <= rh_value
  #     return_arr << lh_value
  #     if lh_idx == left_half.size - 1
  #       return_arr << right_half[rh_idx..-1]
  #       break
  #     end
  #   else
  #     loop do
  #       rh_value = right_half[rh_idx]
  #       return_arr << rh_value
  #       rh_idx += 1
  #       break if rh_idx >= right_half.size
  #       break unless rh_value < lh_value
  #     end
  #     if rh_idx >= right_half.size
  #       return_arr << left_half[lh_idx..-1] 
  #       break
  #     end
  #   end
  # end 
end

# my implemenation would have been easier if i just used a manual loop with 2 couters rather than trying to combine build it iterative and a single manual loop

# one thing I'm realizing is that I can probably just compare the entire arrays as left half and right half that get sorted, assuming they are already sorted.
p merge_sort([9, 5, 7, 1])
p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

p [7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46].sort

didn''t pass last test case
had a lot of trouble iterating through two lists
# other student - mutated the arrays, letting him use #empty? and #shift to keep track.

ANS KEY
way to split the arrays:
  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]
second one is larger if odd length i think

2nd runthrough: took me 27 minutes
# - initialize return_arr == []
# - initialize pointer at index 0 of right_half, `rt_half_idx`
# - iterate from start to end of left_half, `lt_half_value`
#   - `rt_half_value` == right_half[rt_half_idx]
#   - while `right_half_value` < `lt_half_value` || !rt_half_value.nil?
#     - concat rt_half_value to return_arr
#     - increment `rt_half_idx` +1
#     - `rt_half_value` == right_half[rt_half_idx]
#   - concat `lt_half_value` to `return_arr`
# - concat `right_half`[right_half_idx..-1] if right_half_idx <= right_half.size - 1

def merge(left_half, right_half)
  return_arr = []
  rt_half_idx = 0

  left_half.each do |lt_half_value|
    rt_half_value = right_half[rt_half_idx]
    while !rt_half_value.nil? && rt_half_value < lt_half_value # short-circuits
      return_arr << rt_half_value
      rt_half_idx += 1
      rt_half_value = right_half[rt_half_idx]
    end
    return_arr << lt_half_value
  end

  return_arr << right_half[rt_half_idx..-1] if rt_half_idx <= right_half.size - 1
  return_arr.flatten
end

p merge([9, 5], [7, 1])
# one thing of note: #merge assuming that both inputs already sorted
p merge([5, 9], [1, 7])

def merge_sort(arr)
  return arr if arr.size <= 1
  left_half = merge_sort(arr[0, (arr.size / 2.0).ceil])
  right_half = merge_sort(arr[(arr.size / 2.0).ceil..-1])

  merge(left_half, right_half)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

===============================================================
Further Exploration

Every recursive algorithm can be reworked as a non-recursive algorithm. Can you write a method that performs a non-recursive merge sort?

thoughts
  - loop over _
  - other student used length of subarr for pairs until point where length of subarr could not form pair
  - or iterate by quantity of times to loop

DS intermed pathway
arr = [9, 5, 7, 1]
return_arr equal to transformed arr [[9], [5], etc..]

until return_arr size is 1
  tmp = [] 
  until return_arr.empty?
  [] << merge([9], [5]) << merge([7], [1]) << [last] if arr.size == 1
   ^^ temp << ^^ return_arr.shift, return_arr.shift
  [[5, 9], [1, 7]]

  [6, 2, 7, 1, 4]

  [[2, 6], [1, 7], [4]]
  end
  return_arr = tmp ()

until arr.empty? 

43 minutes to figure out - feel so cool for figuring it out
high abstract summary
- return_arr initialized as array containing single element arrays, we loop until there''s only 1 element in return_arr, at end of loop assign return_arr to a temp array which stores the merged (next level up) by using another loop to concatenate into temp the merge of each pair of elements in return_arr
  low lvl algo
    - initialize return arr as the transformed array returned from arr where each element becomes [element]
    - loop until return_arr size == 1
      loop until return_arr size is 0 / empty
        - if return_arr size == 1 
          - concatenate [last element of return_arr]
          else
          - concatenate merge of return_arr shift and return_arr.shift (again)
      - assign return_arr to value of `tmp`

def merge(arr1, arr2)
  return_arr = []
  while !arr1.empty?
    return_arr << arr2.shift while !arr2.empty? && arr2[0] < arr1[0]
    return_arr << arr1.shift
  end
  return_arr << arr2.shift until arr2.empty?
  return_arr
end

def merge_sort(arr)
  return_arr = arr.map { |value| [value] }
  until return_arr.size == 1
    tmp = []
    until return_arr.empty?
      if return_arr.size == 1
        tmp << return_arr.shift
      else
        tmp << merge(return_arr.shift, return_arr.shift)
      end
    end
    return_arr = tmp
  end
  return_arr.flatten
end

# Other student's :/
def merge_sort(arr)
  ret_arr = arr.map { |val| [val] }

  until ret_arr.size == 1
    ret_arr << merge(ret_arr[0], ret_arr[1])
    2.times { ret_arr.shift }
  end

  ret_arr.flatten
end


# he also saved lines by not using a tmp array, just concatenated to end of array and removed the first two elements
# interesting how can indiscriminately merge 2 values within loop cuz alway working within one data structure

# similar
def merge_sort_iterative(arr)
  arr2 = arr.map { |val| [val] }

  until arr2.size == 1
    arr2.push(merge(arr2.shift, arr2.shift))
  end

  arr2.flatten(1)
end


