# LeetCode 167. Two Sum II: input array sorted
#
# PROBLEM:
# Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

# The function twoSum should return (non-zero based) indices of the two numbers such that they add up to the target, where index1 must be less than index2.

#    You may assume that each input would have exactly one solution and you may not use the same element twice.
#
# IN: int array (sorted); int target value
# OUT: array of indices (non-zero based) of the two values that sum to target
#     e.g. `[index1, index2]` where index1 < index2

# DATA STRUCTS:
#   pointers for low and high indices

# ALGO:
#   MODEL: start / end pointers
#
#   set start pointer and end pointer to the termini indicex of array
#
#   while start < end
#     if values at low and high idx sum to target, return [low + 1, high + 1]
#     if sum is > target, reduce total by reducing high pointer idx by 1
#     if sum is < target, increase total by increasing low pointer idx by 1
#
#  return false // unnecessary by stipulations of exactly one solution exists


# faster than 98.51% Ruby; less memory useage than 100%
# TIME: O(N) SPACE: O(1)
def two_sum_sorted(nums, target)
  low = 0
  high = nums.length - 1

  while low < high
    sum = nums[low] + nums[high]

    if sum < target
      low += 1
    elsif sum > target
      high -= 1
    else
      return [low + 1, high + 1]
    end
  end

  false
end

p two_sum_sorted([2,7,11,15], 9) # [1,2]
p two_sum_sorted([2,7,11,15], 18) # [2,3]
p two_sum_sorted([-10,2,7,11,15], -3) # [1,3]
