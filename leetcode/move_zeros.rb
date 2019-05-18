# LeetCode 283. Move Zeros
#
# PROBLEM:
# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

# Note:
#     You must do this in-place without making a copy of the array.
#     Minimize the total number of operations.
#
#  IN: array of numbers
  # OUT: no return; modify in place only

# ALGO 
#   MODEL: anchor / runner
#
#   iterate anchor until find zero
  # iterate runner constantly
#
#  when a non-zero source is found beyond the zero, and anchor is at a zero value
#   value at anchor takes value at source
#   value at source becomes zero


# TIME: O(N) SPACE: O(1)
# LeetCode: faster than 98%; less memory than 99%
def move_zeroes(nums)
  z_finder = 0
  source = 0

  while source < nums.length && z_finder < nums.length
    if nums[z_finder].zero? && !nums[source].zero?
      nums[z_finder] = nums[source]
      nums[source] = 0
    end

    if !nums[z_finder].zero?
      z_finder += 1 
    end

    source += 1 
  end
end


a1 = [0,1,0,3,12]
a2 = [9,1,0,3,13,12,0]
a3 = [0,1,0,3,0,12,0]
a4 = [0,0,0,0,0,12,0]

move_zeroes(a1)
move_zeroes(a2)
move_zeroes(a3)
move_zeroes(a4)

p a1
p a2
p a3
p a4
