# LeetCode 28. Implement strStr()
#
# Implement strStr().

# Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

# I: 'haystack' string; 'needle' string
# O: index of start of pattern match;
#     -1 for no match;
#     0 for empty haystack input
#
  # Clarification:

    # For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().  #
#
# Examples (see tests below)


#
# Data Struct: 
#   `match_start` var to hold start of potential match string; init to -1
#   `compare_idx` var to iterate in seeking match; init to 0
#   `should_compare` var to hold boolean; init to false
#
#
#

# Algo 1:   Brute Force / Intuitive: O(stack.size * needle.size): nested loop
# Time Limit Exceeded on Leetcode test 74 of 74

=begin
def strStr(stack, needle)
  return 0 if (needle.empty? || needle == stack)
  return -1 if stack.size < needle.size

  stack.each_char.with_index do |ch, i|
    if ch == needle[0]
      needle.each_char.with_index do |needle_ch, needle_i|
        break if stack[i + needle_i] != needle_ch
        return i if needle_i == needle.size - 1
      end
    end
  end

  return -1
end
=end

# Algo 2: O(N)
#   init vars as above
#   iterate through stack chars
#     if !should_compare and  needle[compare_idx] matches current char
  #     set should_compare to true
  #     set match_start to current idx
#
# 
#    if needle[compare_idx] != char then should_compare = false && compare_idx = 0; match_start: -1
#
#    if should_compare increment compare_idx        
#    if should_compare && compare_idx.size >  needle.length return match_start


def strStr(stack, needle)
  return 0 if needle.empty?
  return -1 if stack.size < needle.size

  match_idx = -1
  compare_idx = 0
  compare = false

  stack.each_char.with_index do |char, i|

    if !compare && (needle[compare_idx] == char)
      compare = true
      match_idx = i
    end

    if needle[compare_idx] != char
      compare = false
      compare_idx = 0
      match_idx = -1 # superfluous? match_idx is reset with new comparison
    end

    if compare
      compare_idx += 1
    end

    if compare && (compare_idx >= needle.size)
      return match_idx
    end
  end

  return -1
end

p strStr("hello", "ll") # 2
p strStr("hello", "hellooooo") # -1
p strStr("aaaaa", "bba") # -1
p strStr("", "tofu") # -1
p strStr("apple", "") # 0
p strStr("carrots", "carrots") # 0
p strStr("mississippi", "issip") # 4 (in algo 2 actual: -1)


