# LeetCode 1. Two Sum
# Problem: Given an array of integers, return indices of the two numbers such that they add up to a specific target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# IN: array of ints; target sum int
# OUT: array of indices
#
# Examples:
# Given nums = [2, 7, 11, 15], target = 9,
# return [0, 1].
#
# Given nums = [2, 7, 11, 15], target = 18,
# return [1, 2].
#
# NAIVE ALGO: nested loops; TIME: O(N^2)
#    iterate over array keeping track of indices
#     for each element iterate over idx + 1 until end, 
#       return [idx, inner idx] if sum of both values == target

=begin
def two_sum(nums, target)
  i = 0

  while i < nums.size - 1
    diff = target - nums[i]
    j = i + 1

      while j < nums.size
        return [i, j] if nums[j] == diff 
        j += 1
      end

    i += 1
  end
end
=end

# TIME: O(N) SPACE: O(N)
def two_sum(nums, target)
  seen_vals = {}
  i = 0

  while i < nums.size
    diff = target - nums[i]

    if seen_vals[diff]
      return [seen_vals[diff], i]
    else
      seen_vals[nums[i]] = i
    end

    i += 1
  end
end

p two_sum([2,7,11,15], 9)  # [0,1]
p two_sum([2,7,11,15], 18) # [1,2]
p two_sum([3,2,4], 6) # [1,2]

