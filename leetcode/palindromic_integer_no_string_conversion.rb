# 9. [Palindrome Number](https://leetcode.com/problems/palindrome-number/)
# Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

# Example 1:

# Input: 121
# Output: true

# Example 2:

# Input: -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

# Example 3:

# Input: 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

# Follow up:

# Coud you solve it without converting the integer to a string?

# PEDAC
#   in: integer
#   out: boolean re if input is a palindromic number
#     clarification:
#       palindromic number: number whose characters (sign included) read the same forward and backward
#       implications:
#         any signed integer (i.e. with an explicit sign) is not palindromic
#         any integer divisible by 10 is not palindromic, because leading 0 in the input would be removed automatically, and an integer divisible by 10 ends in 10

#         ds: integer (i.e. build a reversed input)
#         algo:
#           high-level: b/c a palindromic int will have the same value as a revesal of its digits, one could solve the problem by building a reversed version of the input and simply comparing the value of the two; negatives and div by 10 can be excluded at outset
#           implementation:
#             guard clause: return false for any negative input
#             guard clause: return false for any div by 10 input
#             build reversed version of input with the div/mod strategy:
#               initialize a reversed int to 0
#               initialize a div to input
#               loop while div > 0
#                 remove lowest place value:
#                   pop = div % 10
#                   div = div / 10
#                   reversed = reversed * 10 + pop 
#              compare reversed with input 

# ACCEPTED SOLUTION
def is_palindrome(int)
  return false if int.negative?
  return true if int < 10
  return false if int % 10 == 0

  reversed = 0
  div = int

  while div.positive?
    ones_val = div % 10
    reversed = (reversed * 10) + ones_val
    div = div / 10
  end

  int.eql?(reversed)
end


