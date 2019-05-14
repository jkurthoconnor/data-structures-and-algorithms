# LeetCode 344. Reverse String
#
# PROBLEM:
# Write a function that reverses a string. The input string is given as an array of characters char[].

# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

# You may assume all the characters consist of printable ascii characters.

# IN: array of chars 
# OUT: input array (same object) with chars reversed

# EXAMPLES:
#   see tests below
#
# DATA STRUCTS:
#   head, tail, temp variables
#     head & tail hold indices and point to extremities
#     temp holds value for swapping
#
#
# ALGO:  MODEL: head/tail pointers for swapping
#   set head and tail to 0 and length - 1
#
#   loop while head > tail
#     using tmp, swap values at head and tail
#     head += 1
#     tail -= 1
#
#   return array
#


# TIME: O(N) SPACE: O(1)
def reverse_string(chars)
  head = 0
  tail = chars.length - 1

  while head < tail
    tmp = chars[head]
    chars[head] = chars[tail]
    chars[tail] = tmp

    head += 1
    tail -= 1
  end

  chars
end

# NB: with idiomatic Ruby, swap takes only one line:
  # chars[head], chars[tail] = chars[tail], chars[head]

s1 = ["h","e","l","l","o"]
s2 = ["H","a","n","n","a","h"]
s3 = [ "1" ]
s4 = [ "a", "b", "B", "A" ]

p reverse_string(s1)
p reverse_string(s2)
p reverse_string(s3)
p reverse_string(s4)

