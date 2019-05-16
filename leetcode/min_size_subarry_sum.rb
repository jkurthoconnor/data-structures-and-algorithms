# LeetCode 209. Minimum Size Subarray Sum
#
# PROBLEM
# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
#
#  Follow up:
#   If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n). 
##

# IN: positive int array, positive int value
#
# OUT: 
#   success: int representing min length of subarray that sums >= s
#   failure: 0
#
# ALGO:
#   MODEL: rubber band runner
#             - runner advances or remains in place
#             - anchor is 'pulled forward' on condition

# TIME: O(N) SPACE: O(1)
# runtime faster than 48.39%; memory usage less than 100%
def min_sub_array_len(target, nums)
  lowest_size = 0 
  anchor = 0
  runner = 0
  sum = nums[0]

  while anchor < nums.size
    if sum >= target
      return 1 if anchor == runner
      sum -= nums[anchor]
      anchor += 1
    elsif runner < nums.size - 1 
      runner += 1 
      sum += nums[runner]
    end

    slice = (runner - anchor) + 1

    if sum >= target && (lowest_size.zero? || slice < lowest_size)
      lowest_size = slice
    end

    break if (runner >= nums.size - 1) && sum <= target
  end

  lowest_size
end

#
p min_sub_array_len(2, [1,3,1,1,4,3]) # 1
p min_sub_array_len(7, [2,3,1,2,4,3]) # 2
p min_sub_array_len(12, [2,3,1,2,4]) # 5  
p min_sub_array_len(7, [7,3,1,2,4,3]) # 1 
p min_sub_array_len(120, [2,3,1,2,4]) # 0 

