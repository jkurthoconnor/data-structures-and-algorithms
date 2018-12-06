# 1. [Two Sum](https://leetcode.com/problems/two-sum/)
#
#
# Problem Statement:
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# Example:
# Given nums = [2, 7, 11, 15], target = 9,

# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# algorithms: 
#   brute force / naive: O(N^2)
#     nested loops: outer advances through array, inner runs ahead and performs calculations
#       return value of outer and inner idx once the target value is the sum

#
# ACCEPTED SOLUTIONS

# def two_sum(nums, target)
#   nums.each_with_index do |n, idx|
#     runnerIdx = idx + 1
#     while runnerIdx < nums.size
#       return [idx, runnerIdx] if n + nums[runnerIdx] == target
#       runnerIdx += 1
#     end
#   end
# end


# def two_sum(nums, target)
#   nums.each_with_index do |n, idx|
#     offset = idx + 1
#     addendIdx = nums[offset..-1].find_index { |t| t + n == target}
#     return [idx, addendIdx + offset] if addendIdx
#   end
# end
#
#
#   with cache:

def two_sum(nums, target)
  cache = {}

  nums.each_with_index do |n, idx|
    differential = target - n
    return [cache[differential], idx] if cache[differential]
    cache[n] = idx
  end
end
