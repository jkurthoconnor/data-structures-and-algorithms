# 3. [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

# in: string
# out: length of longest substing without duplicate characters
#       (assumption: whitespace counts as char)
      
# naive algorithm: O(N^2) [or N^3, or N^4? all the convenience methods probably run a full iteration each as well

# passes local and leetcode tests (faster than 88%), but its time complexity is too high

def longest_sub(string)
  length = string.size
  return length if length < 2
  longest = 1
  current = string[0]
  foot = 0
  head = 1

  while head < length do

    if current.include?(string[head])
      longest = ((head - foot) > longest) ? (head - foot) : longest
      foot = string.index(string[head], foot) + 1
    end

    current = string[foot..head]
    head += 1
  end

  ((head - foot) > longest) ? (head - foot) : longest
end

# to remove the costly include? call, make `current` a hash
# current = { char: last seen idx of char }
#   thus if current[char] is >= foot, then we know it is a duplicate with head
