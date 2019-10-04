# 7. [Reverse Integer](https://leetcode.com/problems/reverse-integer/)
#
# Given a 32-bit signed integer, reverse digits of an integer.
#
# Example 1:

# Input: 123
# Output: 321

# Example 2:

# Input: -123
# Output: -321

# Example 3:

# Input: 120
# Output: 21

# Note:
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

# PEDAC
# in: int
# out: int, reversed input, same sign as input, unless range exceeded
#   implied rule: leading zero is dropped (as expected from an integer)
#
#  naive: guard clause; save sign if any;convert to string; split, reverse, join; prepend sign; exclude out of range

# ACCEPTED SOLUTION:

# def reverse(int)
#   range = (-2147483648...2147483648)
#   return int if (-9..9).include?(int)

#   digits = int.to_s.split('').reverse
  
#   if "+-".include?(digits.last)
#     sign = digits.pop
#   end

#   rev_abs = digits.join.to_i(10)

#   if sign.eql?('-')
#     result = rev_abs * -1
#   else
#     result = rev_abs
#   end

#   return range.include?(result) ? result : 0
# end
#


# without string conversions
#   prep array of place values (reversed order)
#     loop over int, 
#       int, place_value = int.divmod(10)
#       array.push(place_value)
#       break if int.zero?
#    end
#
#    array.map_with_index { |n, idx| n * 10**idx }.sum
#

# ACCEPTED SOLUTION:
def reverse(int)
  return int if (-9..9).include?(int)
  place_values = []
  sign = 1

  if int < 0 
    sign = -1
    int = int.abs
  end

  while true
    int, value = int.divmod(10)
    place_values.push(value)
    break if int.zero?
  end

  offset = place_values.size - 1
  reversed = place_values.map.with_index { |n, idx| n * 10**(offset - idx)}.sum * sign

  return (-2147483648...2147483648).include?(reversed) ? reversed : 0
end


=begin without guarding for range

def rev_digits(int)
  negative = int < 0
  reversed = 0
  unreversed = int.abs

  while !unreversed.zero?
    unreversed, digit = unreversed.divmod(10)
    reversed = (reversed * 10) + digit
  end

  negative ? reversed * -1 : reversed
end

=end
