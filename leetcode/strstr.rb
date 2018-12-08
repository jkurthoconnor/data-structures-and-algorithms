#
# 28. [Implement strStr()](https://leetcode.com/problems/implement-strstr/)
#
# return idx of first occurence of a needle in haystack, or -1 if needle is not part of haystack
#
# Case 1: 
#   in: haystack = "hello"; needle = "ll"
#   out: 2
#
# Case 2:
#   in: haystack = "aaaaa", needle = "bba"
#   out: -1
#

#
# algorithm:
#   iterate chars until find match with first needle char
#     send out runner (inner loop) 
#       & check if idx + 1... matches needle  
#         if no match, break into outer loop
#         if idx is last of needle, return i
#  return -1 if exit outer loop

# timed out on last leetcode test; passes all local tests
def str_str(haystack, needle)
  return 0 if (needle == haystack) || (needle == "")

  haystack.each_char.with_index do |c, c_idx|
    if c == needle[0]
      needle.each_char.with_index do |needle_char, n_idx|
        break unless haystack[c_idx + n_idx] == needle_char
        return c_idx if n_idx == needle.size - 1
      end
    end
  end

  return -1
end

# passing solution with convenience methods:
#
# def str_str(haystack, needle)
#   (haystack =~ /#{needle}/) || -1
# end
