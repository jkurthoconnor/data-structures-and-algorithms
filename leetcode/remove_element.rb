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

p remove_element(a1, 3) # 2 
p remove_element(a2, 2) # 5
p remove_element(a3, 6) # 5
p remove_element(a5, 2) # 1
# address edge cases in leetcode
p remove_element(a4, 3) # [2]
p remove_element(a6, 1) # []

# Example 1:

# Your function should return length = 2, with the first two elements of nums being 2.

# It doesn't matter what you leave beyond the returned length.

# Example 2:

# Given nums = [0,1,2,2,3,0,4,2], val = 2,

# Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.

# Note that the order of those five elements can be arbitrary.

# It doesn't matter what values are set beyond the returned length.

# Clarification:

# Confused why the returned value is an integer but your answer is an array?

# Note that the input array is passed in by reference, which means modification to the input array will be known to the caller as well.

# Internally you can think of this:

# // nums is passed in by reference. (i.e., without making a copy)
# int len = removeElement(nums, val);

# // any modification to nums in your function would be known by the caller.
# // using the length returned by your function, it prints the first len elements.
# for (int i = 0; i < len; i++) {
#     print(nums[i]);
# }

#
