# LeetCode 27. Remove Element
#
# PROBLEM:
# Given an array nums and a value val, remove all instances of that value in-place and return the new length.

# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

# The order of elements can be changed. It doesn't matter what you leave beyond the new length.
#
# IN: array of ints; integer value
# OUT: new length of array (not including any space after target values start)
#
# EXAMPLES:
#   see tests below

# ALGO:
#  vars:
  #  seeker var, set to 0
#  last_not_target, set to array.length - 1
#
# while seeker < last_not_target
#  move last_not_target idx back until it points to a non-target value 
#  advance target_finder to first idx with target value
#    overwrite target-finder
# return last_non_target + 1
#


# figure out edge cases with pointer positions

def remove_element(nums, target)
  target_finder= 0
  last_non_target = nums.size - 1

  while target_finder < last_non_target
    target_finder += 1 unless nums[target_finder] == target
    last_non_target -= 1 unless nums[last_non_target] != target

    if nums[target_finder] == target && nums[last_non_target] != target
      nums[target_finder] = nums[last_non_target]
      last_non_target -= 1
    end
  end

  target_finder + 1
end

a1 = [2,2,3,3]
a2 = [0,1,2,2,3,0,4,2]
a3 = [9,4,6,6,3,7,6,1]
a4 = [2]
a5 = [2,3]
a6 = [1]
a7 = [5,5,5,5,5]

p remove_element(a1, 3) # 2 
p remove_element(a2, 2) # 5
p remove_element(a3, 6) # 5
p remove_element(a5, 2) # 1
# address edge cases in leetcode
# p remove_element(a4, 3) # [2]
# p remove_element(a6, 1) # []
# WHY DOES THIS WORK?
p remove_element(a7, 5) # 0

