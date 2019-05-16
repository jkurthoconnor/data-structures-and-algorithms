# LeetCode 35. Search Insert Position
#
# PROBLEM:
# Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

# You may assume no duplicates in the array.
#
# IN: sorted array; target value
# OUT: success: idx of value in array
#      fail: idx where value should be if it were in the array

# DATA STRUCT: n/a
#
# ALGO:
#   MODEL: binary search 
#           - adapt return conditions to return idx on failure to find
#

# TIME: O(N) SPACE: O(1)
# LeetCode: faster than 100%; less memory than 100%
def search_insert(nums, target)
  low = 0
  high = nums.length - 1

  while low + 1 < high
    mid = low + (high - low) / 2
    return mid if nums[mid] == target

    if target < nums[mid]
      high = mid
    else
      low = mid
    end
  end

  if nums[low] == target
    return low
  elsif nums[low] > target && (low != 0)
    return low - 1
  elsif nums[high] < target
    return high + 1
  elsif nums[high] == target || nums[low] < target
    return high
  else
    return 0
  end
end



p search_insert([1,3,5,6], 3) # 1
p search_insert([1,3,5,6], 5) # 2
p search_insert([1,3,5,6,7], 5) # 2
p search_insert([1,3,5,6,10], 5) # 2
p search_insert([1,3,5,6], 6) # 3
p search_insert([-11,-3,5,6], 6) # 3
p search_insert([-11,-3,5,6], -11) # 0
p search_insert([1,3,5,6], 2) # 1 
p search_insert([1,3,5,6], 7) # 4
p search_insert([1,3,5,6], 0) # 0
