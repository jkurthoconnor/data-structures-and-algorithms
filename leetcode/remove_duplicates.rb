# LeetCode 26. Remove Duplicate From Sorted Array
#
# PROBLEM:
# Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.

#     Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

#   It doesn't matter what you leave beyond the returned length.


# ALGO:
# MODEL: anchor with unidirectional fast value-seeking runner
#         - find 1st instance of new/unique value
#         - overwrite value at next available slot with new/unique value
#         - *** don't care about actual removal: only care to ensure 
#           series of unique values compressed to front; any values remaining 
#           at end are irrelevant ***
#         - *** think of 'pulling' desired values forward, _not_ pushing unwanted
#           values to the back
#
# TIME: O(N) SPACE: O(1)
# faster than 89.49%; less memory than 98.69%
def remove_duplicates(nums)
  prev_write = 0
  new_uniq = 0

  while new_uniq < nums.length
    while nums[prev_write] == nums[new_uniq]
      new_uniq += 1
    end

    if nums[new_uniq] && (prev_write.next != new_uniq) # prevent overrun & write to self
      nums[prev_write.next] = nums[new_uniq]
    end

    prev_write += 1
  end

  return prev_write
end

p remove_duplicates([2]) # 1
p remove_duplicates([1,2]) # 2
p remove_duplicates([1,1]) # 1
p remove_duplicates([1,1,2]) # 2
p remove_duplicates([0,0,1,1,1,2,2,3,3,4]) # 5
