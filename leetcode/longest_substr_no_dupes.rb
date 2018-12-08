# 3. [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

# in: string
# out: length of longest substing without duplicate characters
#       (assumption: whitespace counts as char)
#
# original naive algorithm:
#
#   - use of `include?` in the if condition and `index` to reset foot surely added
#   O(N) for each loop, so O(N^2) or O(N^3) time seems appropriate
#
# current algorithm: O(N) time
#   use of a hash to maintain highest index of seen chars allows O(1) time for the access in the if condition and in resetting the foot value


def longest_sub(string)
  length = string.size
  return length if length < 2
  foot, head, longest = 0, 1, 1
  current = { string[0] => 0 }

  while head < length do
    head_seen_prev_at = current[string[head]]

    if head_seen_prev_at && head_seen_prev_at >= foot
      longest = ((head - foot) > longest) ? (head - foot) : longest
      foot = head_seen_prev_at + 1
    end

    current[string[head]] = head 
    head += 1
  end

  ((head - foot) > longest) ? (head - foot) : longest
end
