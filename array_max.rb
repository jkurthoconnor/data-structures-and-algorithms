# Problem:
# Find the maximum number in an array of numbers
#
# IN: array of numbers
# OUT: the max number
#
#

def array_max(arr)
  array_max_helper(arr, 0, arr.length - 1)
end

def array_max_helper(arr, low, high)
  return arr[high]  if low == high

  mid = (high + low) / 2

  left_max = array_max_helper(arr, low, mid)
  right_max = array_max_helper(arr, mid + 1, high)

  left_max > right_max ? left_max : right_max
end

p array_max([1,2,100,2,3])                        # 100
p array_max([1,2,100,2,3,19,200000, 43])          # 200000
p array_max([-1,-2,-100,-2,-3,-19,-200000, -43])  # -1

