# 14. [Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)
#
# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

# Example 1:

# Input: ["flower","flow","flight"]
# Output: "fl"

# Example 2:

# Input: ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

# Note:

# All given inputs are in lowercase letters a-z#
#
# PEDAC
#   in: array of strings, each in lowercase only
#   out: string; empty if no common prefix, else the prefix
#
#    implied definition: common prefix: sequence of chars starting with idx0 that is shared (both char and order) by all members of the input array 
#
# D: prefix string; initialized to "" (return value of no prefix), and built up char by char as each is determined to be common
#
# Algo:
#   init prefix string var
#   set a pointer to the first idx of each or first element (outer loop sets char idx); have curr_char = arr.first[idx]
#   iterate over elements
  #   if current_element[i] != curr_char, return prefix string
#   add curr_char to prefix string
#
# ACCEPTED SOLUTION:
# time: O(W*N)
#   W = first word length; N = string array length
# space: O(W)
#
def longest_common_prefix(strs)
  prefix = ""
  return prefix if strs.empty?

  strs.first.each_char.with_index do |char, idx|
    strs[1..-1].each do |word|
      return prefix if word[idx] != char
    end
    prefix << char
  end
  prefix
end
