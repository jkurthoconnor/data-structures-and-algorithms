=begin
LeetCode 47. Permutations II

Given a collection of numbers that might contain duplicates, return all possible unique permutations.

Example:

Input: [1,1,2]
Output:
[
  [1,1,2],
  [1,2,1],
  [2,1,1]
]


BASE CASE:
 temp.size == input.size and results does not has a copy of the same array (order matters)

RECURSIVE CASE:
 for each element of the input collection
  push onto tmp
  recurse()
  pop element off of tmp
=end


def permute_unique(nums)
  result = []
  helper(nums, result)
  result
end

# only returns result of full array
def helper(nums, result, tmp=[], start=0)
  if (tmp.size == nums.size) # && !result.include?(tmp)
    result.push(tmp.clone)
  else

    idx = start
    while idx < nums.length
      tmp.push(nums[idx])
      helper(nums, result, tmp, idx + 1)
      tmp.pop
      idx += 1
    end
  end
end

a1 = [1,1,2]

p permute_unique(a1)
