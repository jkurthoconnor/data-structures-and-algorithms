# 680. [Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/)

#  Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

# Example 1:

# Input: "aba"
# Output: True

# Example 2:

# Input: "abca"
# Output: True
# Explanation: You could delete the character 'c'.

# Note:

#     The string will only contain lowercase characters a-z. The maximum length of the string is 50000.


# algo:
#   two pointers, left and right, converge until one passes the other
#     at each iteration, check that the chars match
#     if they don't and `pass_allowed`,
#       set `pass_allowed to false
#       if left + 1 === right, left + 1
#       elsif right -1 === left, right -1
#     else
#       return false
#

def valid_palindrome(str)
  pass_allowed = true
  left, right = [0, str.length - 1]

  while left < right do
    if pass_allowed && (str[left] != str[right])
      pass_allowed = !pass_allowed
      if str[left + 1] === str[right]
        # left += 1
        right -= 1
      elsif str[right - 1] === str[left]
        # right -= 1
        left += 1
      else
        return false
      end
    elsif str[left] != str[right]
      return false
    end
    left += 1
    right -= 1
  end

  true
end

p valid_palindrome( "aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga") # returns true, as expected by leetcode

now "tcaac" fails
refactor to allow for moving either pointer as necessary; I made the first problem fit by replacing the commented out lines with the ones beneath them
