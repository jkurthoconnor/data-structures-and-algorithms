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
# iterate until find zero
#  loop from that point until end of array
#   value at idx = value at idx + 1
#  array[lastidx] = 0


def move_zeroes(nums)
  reader = 0
  del_count = 0

  while reader < nums.length - del_count
    if nums[reader].zero?
      nums.delete_at(reader) # MAGIC!!!
      del_count += 1
      nums[nums.length] = 0
    else
      reader += 1
    end
  end
end
a1 = [0,1,0,3,12]  
a2 = [9,1,0,3,13,12,0]
a3 = [0,1,0,3,0,12,0]

move_zeros(a1)
move_zeros(a2)
move_zeros(a3)

p a1
p a2
p a3
