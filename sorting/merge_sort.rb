# merge sort
#
# define sorted array:
#   array: left half + right half
#   sorted array: sorted(sorted left half + sorted right half)
#
  # div: reduce data set toward the base case
  # conquer: make recursive calls, pushing solution forward
  # combine: implement actual problem specific logic; bulk of programming here
#

def mergesort(arr)
  return arr if arr.length == 1

  mid = (arr.length / 2) - 1
  left = arr[0..mid]
  right = arr[mid + 1..arr.length - 1]

  left = mergesort(left)
  right = mergesort(right)

  merge(left, right)
end

def merge(arr1, arr2)
  result = []
  p1 = 0
  p2 = 0

  while (p1 < arr1.length) && (p2 < arr2.length)
    if arr1[p1] < arr2[p2]
      result.push(arr1[p1])
      p1 += 1
    else
      result.push(arr2[p2])
      p2 += 1
    end
  end

  if p1 < arr1.length
    result.push(*arr1[p1..arr1.length - 1])
  elsif p2 < arr2.length
    result.push(*arr2[p2..arr2.length - 1])
  end

  result
end

p mergesort([1,9,43,2,12])
p mergesort([19,12,32,100,23,32])
