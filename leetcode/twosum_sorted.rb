# 167. [Two Sum II - Input Array is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/) 

# Problem Description:
# Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

# The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.

# Note:
#     Your returned answers (both index1 and index2) are not zero-based.
#     You may assume that each input would have exactly one solution and you may not use the same element twice.

# Example:
#   Input: numbers = [2,7,11,15], target = 9
#   Output: [1,2]
#   Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
#
# algorithm: O(N) time
#     given the input is sorted in ascending order, moving position from left to right will increase the value [or maintain the same] stored at a resulting index; moving from right to left will decrease the value [or maintain the same]
#
#     use two pointers, starting at each terminus of the array
#     if low + high > target, move high down one space
#                   < target, move low up one space
#                   == target, return low + 1, high + 1
#

def two_sum_sorted(nums, target)
  low, high = [0, (nums.size - 1)]

  while true
    case (nums[low] + nums[high]) <=> target
    when  1  then high -= 1
    when -1  then low += 1
    else     return [low + 1, high + 1]
    end
  end
end
