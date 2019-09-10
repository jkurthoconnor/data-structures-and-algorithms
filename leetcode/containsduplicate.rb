# 217. [Contains Duplicate](https://leetcode.com/problems/contains-duplicate/)
#
# Problem Statement:

#   Given an array of integers, return true if any value appears at least twice in the array, and return false if every element is distinct.

#   Example 1:
#     in: [1,2,3,1]
#     out: true

#   Example 2:
#     in: [1,2,3,4]
#     out: false

#   Example 3:
#     in: [1,1,1,3,3,4,3,2,4,2]
#     out: true
#
#   Additional Example;
#     in: []
#     out: false
#
#
# A: naive: nested loops time: O(N) (incrementing anchor with runner resetting to anchor + 1)

# def contains_duplicates(numbers)
#   numbers.each_with_index do |n, idx|
#     seeker = idx + 1

#     while seeker < numbers.size
#       return true if numbers[seeker] == n
#       seeker += 1
#     end
#   end
  
#   false
# end
#
# algorithm:
#   naive: O(N log N) assuming quicksort
#          sort array;
#          loop over sorted array
  #          use two adjacent pointers sliding forward one idx per iteration
  #          if ever the two pointers reference same value return true
#          if loop exits, then end of array is reached by lead pointer, return false
#

# def containsduplicate(nums)
#   sorted = [*nums].sort

#   sorted.each_with_index do |n, idx|
#     return true if n == sorted[idx + 1]
#   end

#   false
# end



#  algorithm with memoization: O(N)
#     create empty cache
#     loop over array
#       if cache[ array[idx] ] return true
#       cache[array[idx]] = true
#     return false if 

def containsduplicate(nums)
  seen = {}

  nums.each do |n|
    seen[n] ? (return true) : (seen[n] = true)
  end

  false
end
