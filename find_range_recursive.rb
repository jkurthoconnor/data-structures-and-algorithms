require_relative 'binary_search_recursive'

def find_range(array, target)
  target_at = binary_search(array, target)
  return [-1, -1] if target_at == -1

  left_term = find_left_end(array, target, 0, target_at)
  right_term = find_right_end(array, target, target_at, array.length - 1)

  [left_term, right_term]
end

def find_left_end(arr, target, low, target_at)
  if arr[target_at - 1] != target
    return target_at
  else
    find_left_end(arr, target, low, target_at - 1)
  end
end

def find_right_end(arr, target, target_at, high)
  if arr[target_at + 1] != target
    return target_at
  else
    find_right_end(arr, target, target_at + 1, high)
  end
end

p find_range([7,7,8,8,10], 7)              # [0,1]
p find_range([5,5,7,7,8,8,9,9,9,10], 9)    # [6,8]
p find_range([5,7,7,8,8,10], 8)            # [3,4]
p find_range([7,7,8,8,10], 1)              # [-1,-1] 

