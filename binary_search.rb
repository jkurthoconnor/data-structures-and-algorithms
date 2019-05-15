def binary_search(array, target)
  low = 0
  high = array.length - 1

  while low <= high
    mid = (high + low) / 2
    return mid if array[mid] == target

    (array[mid] < target) ? (low = mid + 1) : (high = mid - 1)
  end

  return -1
end

p binary_search([1,2,3,4,5], 5) # 4
p binary_search([1,2,3,4,5], 1) # 0
p binary_search([1,2,3,4,5], 3) # 2
p binary_search([1,2,3,4,5], 2) # 1
p binary_search([1,2,3,4,5], 8) # -1
