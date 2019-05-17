# May 17, 2019, Problem B: [Intersection of two arrays](https://leetcode.com/problems/intersection-of-two-arrays/#/description)

# Solution: there are many.. the trick is to have students go through the process of working through the naive -> optimization process and work out bigO for various solutions. Also, challenge the other person to assert certain metrics can't be met. 
# - with hash table
# - sort one array, binary search
# - sort both arrays
#
# Given two arrays, write a function to compute their intersection.

# Example 1:

# Input: nums1 = [1,2,2,1], nums2 = [2,2]
# Output: [2]

# Example 2:

# Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
# Output: [9,4]

# Note:

#     Each element in the result must be unique.
#     The result can be in any order#
#
#
# TIME: O(n1 + n2)
def intersection_with_hash(nums1, nums2)
  seen = {}
  intersection = []

  nums1.each do |n|
    if !seen[n]
      seen[n] = true
    end
  end

  nums2.each do |n|
    if seen[n]
      intersection.push(n)
      seen[n] = false
    end
  end

  intersection
end


p intersection_with_hash([1,2,2,1], [2,2])
p intersection_with_hash([4,9,5], [9,4,9,8,4])
