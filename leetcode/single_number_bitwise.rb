=begin
LeetCode 136. Single Number

PROBLEM:
Given a non-empty array of integers, every element appears twice except for one. Find that single one.

Note:
Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

Example 1:
  Input: [2,2,1]
  Output: 1

Example 2:
  Input: [4,1,2,1,2]
  Output: 4


KEY OPERATIONS:

 n XOR n always returns 0
 
XOR is commutative: `a XOR b` is equivalent to `b XOR a`
XOR is associative: `(a XOR b) XOR c` is equivalent to `a XOR (b XOR c)`

thus `a XOR <series>` will 'zero out' `a` if `a` is encountered in the series

These properties allow us to keep a 'running XOR' (like a running sum), that will leave whatever values remain after pairs of same values XOR / zero each other out

Under the constraints of the problem, where each value occurs 2x except for one that occurs 1x, we will be left with a running XOR value of only the 1x element
=end

# LeetCode: faster than 62%; less memory than 98%
# TIME: O(N); SPACE O(1)
def single_number(nums)
  pair_evaporator = 0

  nums.each do |n|
    pair_evaporator ^= n
  end

  pair_evaporator
end

p single_number([2,2,1])
p single_number([4,1,2,1,2])


