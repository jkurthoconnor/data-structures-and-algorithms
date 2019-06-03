=begin
Quick Sort

algorithm: Like merge sort, quick sort employs a divide and conquer algorithm

base case: return when array has 0 || 1 elements

pivot = partition array
# recursive calls
quicksort(array to left of pivot)
quicksort(array to right of pivot)

####
Partitioning an array
  a ranm element is chosen as the 'pivot' point
  every element that is greater than the pivot is placed to the right of pivot
  every element that is less than the pivot is placed to the left of pivot

partitioning algorithm:
select an index/value to be the pivot; here, the last idx/element
assign pointer to left most idx/element
assign pointer to right most idx/element (excluding pivot)

until pointer values are equal or left pointer idx > right pointer idx
  left pointer moves to right until lands on value >= pivot value
  right pointer moves to left until lands on value <=  pivot value
  swap values at left and right pointers

swap pivot value/location and left pointer value location

(if using with quicksort) return left pointer idx
=end

def quicksort(array, left_idx, right_idx)
  if right_idx - left_idx <= 0
    return
  end

  pivot = partition(array, left_idx, right_idx)

  quicksort(array, left_idx, pivot - 1)
  quicksort(array, pivot + 1, right_idx)
end


def partition(array, left_idx, right_idx)
  pivot = right_idx
  pivot_value = array[right_idx]
  right_idx -= 1

  while true 
    until array[left_idx] >= pivot_value
      left_idx += 1
    end

    until array[right_idx] <= pivot_value
      right_idx -= 1
    end

    break if left_idx >= right_idx

    array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
  end
 
    array[left_idx], array[pivot] = array[pivot], array[left_idx]

  return left_idx
end

a1 = [1,4,3,5,9]
a2 = [9,10,2,1,100,4]


quicksort(a1, 0, a1.length - 1)
quicksort(a2, 0, a2.length - 1)

p a1
p a2
