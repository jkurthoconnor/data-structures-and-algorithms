=begin
LeetCode 88. Merge Sorted Array

PROBLEM:
Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

Note:

    The number of elements initialized in nums1 and nums2 are m and n respectively.
    You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.

Example:

Input:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

Output: [1,2,2,3,5,6]

IN: two arrays of int; values of their lengths
OUT: the first array with array2 sorted into it

Both arrays are sorted already, so one could simply iterate across each, compare values and insert as approptiate. 

- working from the front of each array would (likely) require repeated cycles of moving values in array1 towards the end to make room for inserted values

- working from the back of each array would allow insertion at the end of array1. Since we are told array1 already has sufficient space allocated, we know its end has at least array2.length empty spots. Working and inserting into these end spots will prevent the need to constantly adjust to make space.


ALGORITHM:
set index variables to the end of both arrays
set insert_at index variable to array1.length + array2.length - 1

as long as there are indices remaining in array2:
  if a1_end >= 0 and its value is greater than the value at arr2 idx
    write a1_end value to a1[insert_at]
    a1_end --
  else  
    write a2_end value to a1[insert_at]
    a2_end --

  insert_at --

=end

# LeetCode: faster than 97%; less memory than 100%
#
# TIME: O(m + n); SPACE: O(1)
def merge(a1, a1_size, a2, a2_size)
  insert_at = a1_size + a2_size - 1
  a1_idx = a1_size - 1
  a2_idx = a2_size - 1

  while a2_idx >= 0
    if a1_idx >= 0 && a1[a1_idx] > a2[a2_idx]
      a1[insert_at] = a1[a1_idx]
      a1_idx -= 1
    else
      a1[insert_at] = a2[a2_idx]
      a2_idx -= 1
    end

    insert_at -= 1
  end
end

arr1 = [1,2,3]
arr2 = [2,5,6]

merge(arr1, 3, arr2, 3)
p arr1

