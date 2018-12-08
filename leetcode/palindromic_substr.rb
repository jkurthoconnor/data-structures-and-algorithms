# 647. [Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/)
#
# Problem Statement:
# Given a string, your task is to count how many palindromic substrings in this string.

# The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.

#Example 1:

#Input: "abc"
#Output: 3
#Explanation: Three palindromic strings: "a", "b", "c".

#Example 2:

#Input: "aaa"
#Output: 6
#Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".

#Note:

 #   The input string length won't exceed 1000.
##
#
# PEDAC
# in: string
# out: int, count of palindromic substrings
#           def: palindromic substrings: 
#             1. a string consisiting of all or part of the input string, fo
#             2. that reads the same forward and backward
#               - each individual char counts as palindromic;
#               - palindromes may overlap: diff start or stop idx distinguishes a substring from another
#               - empty string is not palindromic (per testing)
#               - the whole string may count as its own substring
#
# naive algo: nested loops,
#   initialize `count` to string length
#
#   initialize `foot`0 and `head`0 pointers
#   while `foot` < length - 1
#     head = foot + 1
#     while `head` < length
  #     if str[foot..head] == str[head..foot], count += 1
#       head += 1
#     end
#     foot +=1
#    end
#
#
#
# ACCEPTED SOLUTION:
#
def count_substrings(string)
  length = string.size
  count, foot, head = length, 0, 0

  while foot < length - 1
    head = foot + 1
    while head < length
      count += 1 if string[foot..head].eql?(string[foot..head].reverse)
      head += 1
    end
    foot += 1
  end

  count
end

# The biggest obvious inefficiency of the above is in running `reverse` on every potential palindromic substring. Since a string can't be palindromic unless the chars at 0 & -1 are the same, 1 & -2, and so on, refactor with an inner loop to check char by char by moving two pointers inward from the termini; as soon as they don't reference equal strings, break and increment head

# despite the attempt at reducing time complexity, this code below passes all local tests, but times out on leetcode.
#
# def count_substrings(string)
#   length = string.size
#   count, foot, head = length, 0, 0

#   while foot < length - 1
#     head = foot + 1

#     while head < length
#       left, right = foot, head

#       while left < right
#         break if string[left] != string[right]
#         left += 1
#         right -= 1
#         count += 1 if left >= right
#       end

#       head += 1
#     end
#     foot += 1
#   end

#   count
# end
