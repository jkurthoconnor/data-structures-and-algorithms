# LeetCode 26. Remove Duplicate From Sorted Array
#
# PROBLEM:
# Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.

#     Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

#   It doesn't matter what you leave beyond the returned length.


# ALGO:
# i & j = 0

# while j < nums.length
#   while j value == i value, 
#       increment j

#   write j value to i+1
#   increment i
# end

# TIME: O(N) SPACE: O(1)
def remove_duplicates(nums)
  anchor = 0
  new_finder = 0

  while new_finder < nums.length
    while nums[anchor] == nums[new_finder]
      new_finder += 1
    end

    if nums[new_finder] && (anchor + 1 != new_finder) # prevent overrun and write to self
      nums[anchor + 1] = nums[new_finder]
    end

    anchor += 1
  end

  return anchor
end

p remove_duplicates([2]) # 1
p remove_duplicates([1,2]) # 2
p remove_duplicates([1,1]) # 1
p remove_duplicates([1,1,2]) # 2
p remove_duplicates([0,0,1,1,1,2,2,3,3,4]) # 5
