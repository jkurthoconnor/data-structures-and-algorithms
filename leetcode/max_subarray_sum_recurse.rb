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


#                                           mss([2,3,4], 0, 2)   =>9


#                 mss([2,3,4],0,1)           mss([2,3,4], 2,2)        mcs([2,3,4], 0,1,2)
#                      * *    =>5                   *    =>4               * * *  =>9

#
# mss([2,3,4],0,0)     mss([2,3,4],1,1)   mcs([2,3,4],0,0,1)
#      *      =>2             *   =>3          * *    =>5
#
#
#
# BRANCHING DOWN UNTIL BASE CASE
# RETURNS FLOW UP FROM LEAF NODES
