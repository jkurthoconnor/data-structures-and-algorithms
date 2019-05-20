def binary_search(array, target)
  binary_search_helper(array, target, 0, array.length - 1)
end

def binary_search_helper(arr, target, low, high)
  return - 1 if low > high

  mid = low + (high - low) / 2
  mid_value = arr[mid]

  if mid_value == target
    return mid
  elsif mid_value < target
    return binary_search_helper(arr, target, mid + 1, high)
  else 
    return binary_search_helper(arr, target, low, mid - 1)
  end
end

p binary_search([1,2,3,4,5], 5) # 4
p binary_search([-10,-8,-3,-2,-1], -1) # 4
p binary_search([1,2,3,4,5], 3) # 2
p binary_search([1,2,3,4,5], 2) # 1
p binary_search([-10,-2,3,4,5], -2) # 1
p binary_search([1,2,3,4,5], 1) # 0
p binary_search([1,2,3,4,5], 8) # -1
