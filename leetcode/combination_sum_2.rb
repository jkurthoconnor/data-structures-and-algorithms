=begin
LeetCode 40. Combination Sum II

Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

Each number in candidates may only be used once in the combination.

Note:

    All numbers (including target) will be positive integers.
    The solution set must not contain duplicate combinations.

Example 1:

Input: candidates = [10,1,2,7,6,1,5], target = 8,
A solution set is:
[
  [1, 7],
  [1, 2, 5],
  [2, 6],
  [1, 1, 6]
]

Example 2:

Input: candidates = [2,5,2,1,2], target = 5,
A solution set is:
[
  [1,2,2],
  [5]
]

BASE CASE:
  candidates >= sum
    if == push candidates to result
    if > return


RECURSIVE CASE:
  choose one value and place it into consideration (tmp)
  recurse consider all other numbers (by idx) except it
  remove from consideration
=end

def combination_sum2(nums, target)
  result = []
  helper(nums.sort, target, result)
  result
end

def helper(nums, target, result, tmp=[], idx=0, sum=0)
  puts "#{'  ' * tmp.size} f(#{nums}, #{target}, result=#{result}, tmp=#{tmp} idx=#{idx}, sum=#{sum})"

  if sum > target
    return
  elsif sum == target && !result.include?(tmp)
    result.push(tmp.clone)
  else

    i = idx
    while i < nums.size
      tmp.push(nums[i])
      helper(nums, target, result, tmp, i + 1, sum + nums[i])
      tmp.pop

      i += 1
    end
  end
end


a1 = [10,1,2,7,6,1,5]
a2 = [2,5,2,1,2]

p combination_sum2(a1, 8)
p combination_sum2(a2, 5)

