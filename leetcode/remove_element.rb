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
  #  tmp
#
# while seeker < last_not_target
#  move last_not_target idx back until it points to a non-target value 
#  advance seeker to first idx with target value
#    swap values of last_non_target and seeker
# return last_non_target



# **** is swap necessary?
def remove_element(nums, value)
  return [] if nums.length == 1 && nums[0] == value
  return nums if nums.length == 1

  extract_from = 0
  insert_at = nums.length - 1

  while extract_from < insert_at
    until nums[extract_from] == value || extract_from >= insert_at
      extract_from += 1
    end

    until nums[insert_at] != value || extract_from >= insert_at
      insert_at -= 1
    end

    nums[extract_from], nums[insert_at] = nums[insert_at], nums[extract_from]
  end

  insert_at
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
p remove_element(a4, 3) # [2]
p remove_element(a6, 1) # []
# WHY DOES THIS WORK?
p remove_element(a7, 5) # 0

