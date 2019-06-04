=begin
LeetCode 90. Subsets II

PROBLEM:

Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: [1,2,2]
Output:
[
  [2],
  [1],
  [1,2,2],
  [2,2],
  [1,2],
  []
]


MODEL:
  backtracking subset generation

  BASE CASE:
    if the tmp solution is not already included in the results, push a copy to results

  RECURSIVE CASE:
    recursion nested in a loop to iterate over all possible combinations
=end

# LeetCode: faster than 11%!!!; less memory than 52%
def subsets_with_dup(nums)
  result = []
  helper(nums, result)
  result
end

def helper(nums, result, tmp=[], start_idx=0)
  if !result.map(&:sort).include?(tmp.sort) # sorting catches rearranged duplicates
    result.push(tmp.clone)
  end

  idx = start_idx

  while idx < nums.size
    tmp.push(nums[idx])                    # without a value-based `next`
    helper(nums, result, tmp, idx + 1)     # allows for duped values if not
    tmp.pop                                # from same idx 
    idx += 1
  end
end

a1 = [1,2,2]
p subsets_with_dup(a1)
