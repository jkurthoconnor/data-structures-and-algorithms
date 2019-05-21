def max_crossing_sum(arr, low, mid, high)
  left_sum  = -1000000000 # or some other arbitrarily small value
  right_sum = -1000000000
  sum = 0

  arr[low..mid].each do |n|
    sum += n
    left_sum = sum if (sum > left_sum)
  end

  sum = 0
  arr[mid + 1.. high].each do |n|
    sum += n
    right_sum = sum if (sum > right_sum)
  end

  left_sum + right_sum
end


def max_subarray_sum(arr, low, high)
  return arr[low] if (low == high)  # base case
  mid = (low + high) / 2 # divide 

  # conquer & combine
  [
   max_subarray_sum(arr, low, mid),
   max_subarray_sum(arr, mid + 1, high),
   max_crossing_sum(arr, low, mid, high) 
  ].max
end

a = [2,3,4,5,7]
b = [100, 200, 19, 100000, 12, 4]
c = [2,3,4]

p max_subarray_sum(a, 0, a.length - 1)
p max_subarray_sum(b, 0, b.length - 1)
p max_subarray_sum(c, 0, c.length - 1)

# without the `crossing` method, the function returns the max sized element

# CALL 1:
# mid = 2
  #   CALL 2 LEFT SIDE:
#       f([2,3,4,5,7], 0, 2)
#           mid =  1
  #         CALL 3:
#           f([2,3,4,5,7], 0, 1)
#           f([2,3,4,5,7], 2, 4)
#                 mid = 0
  #               CALL 4:
      #           f([2,3,4,5,7], 0, 0)  # return 2
      #           f([2,3,4,5,7], 1, 4)
#                 
#           f([2,3,4,5,7], 2, 4)
#
#
#       CALL 2 RIGHT SIDE:
  #       f([2,3,4,5,7], 3, 4)


