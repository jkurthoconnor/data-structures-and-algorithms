# Search for a Range
#
# PROBLEM:
# Given a sorted array of integers, find the starting and ending position of a given target value. Your algorithm's runtime complexity must be in the order of O(log n). If the target is not found in the array, return [-1, -1]. For example, given [5, 7, 7, 8, 8, 10] and target value 8, return [3, 4].
#
# IN: sorted int array; target
# OUT: success: array of start and end idx for range of target value
#      failure: [-1, -1]
#
#  MODEL: binary search with added conditions
#         
#  ALGO:
#   binary search for target.
#     if found
  #     if found and target (mid) idx - 1 also holds value, reset search to the left
  #     if found and target idx - 1 does not hold same value, that is start of range
  #     if found and target idx + 1 also holds value, reset search to the right
  #     if found and target idx + 1 does not hold same value, that is the end of range
#
#   if target not found, return [-1, -1]
#
#  MODIFIED ALGO:
#
#   break up above logic into two uses of binary search
#     * 1 to find low terminus
#     * 1 to find high terminus
#   have function call each application of binary search

# TIME: O(N)
def find_low_terminus(nums, target)
  low = 0
  high = nums.length - 1
  location = []

  while low + 1 < high
    mid = low + (high - low) / 2

    if nums[mid] == target 
      if mid == 0 || nums[mid - 1] != target
        return mid
      else
        high = mid
      end

      next
    end

    if nums[mid] > target
      high = mid
    else
      low = mid
    end
  end

  if nums[low] == target
    return low
  elsif nums[high] == target
    return high
  else
    return -1
  end
end

def find_high_terminus(nums, target)
  low = 0
  high = nums.length - 1
  location = []

  while low + 1 < high
    mid = low + (high - low) / 2

    if nums[mid] == target
      if mid == nums.length - 1 || nums[mid + 1] != target
        return mid
      else
        low = mid
      end

      next
    end

    if nums[mid] > target
      high = mid
    else
      low = mid
    end
  end

  if nums[high] == target
    return high
  elsif nums[low] == target
    return low
  else
    return -1
  end
end


def find_range(nums, target)
  [ find_low_terminus(nums, target), find_high_terminus(nums, target) ]
end

p find_range([5,7,7,8,8,10], 8) # [3,4]
p find_range([1,2,3,9,9,9], 9)  # [3,5]
p find_range([1,2,3,9,9,9], 2)  # [1,1]
p find_range([2,2,2,9,9,9], 2)  # [0,2]
p find_range([1,2,3,9,9,9], 4)  # [-1,-1]

