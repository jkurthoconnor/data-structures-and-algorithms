=begin
LeetCode 39. Combination Sum

PROBLEM:

Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

The same repeated number may be chosen from candidates unlimited number of times.

Note:
    All numbers (including target) will be positive integers.
    The solution set must not contain duplicate combinations.

Example 1:

Input: candidates = [2,3,6,7], target = 7,
A solution set is:
[
  [7],
  [2,2,3]
]

Example 2:

Input: candidates = [2,3,5], target = 8,
A solution set is:
[
  [2,2,2,2],
  [2,3,3],
  [3,5]
]

IN: arr uniq int ; target int
OUT: 2-d array of all possible combinations of input arr values

ALGORITHM:

treat as a combinations problem, with base case managing sums

BASE CASE:
  if sum of combination == target push target to results
  elsif sum of combination > target, return
    

RECURSIVE CASE:
  for each element in collection 
    push element onto tmp
    recurse()
    pop element off of collection


=end

# LeetCode: faster than 6%; less memory than 42%
def combination_sum(nums, target)
  result = []
  helper(nums, target, result)
  result
end

def helper(nums, target, result, tmp = [])
  sum = tmp.sum

  if (sum == target) && !(result.map(&:sort).include?(tmp.sort))
    result.push(tmp.clone)
  elsif sum > target
    return
  else
    nums.each do |n|
      tmp.push(n)
      helper(nums, target, result, tmp)
      tmp.pop
    end
  end
end

a1 = [2,3,6,7]
a2 = [2,3,5]

p combination_sum(a1, 7)
p combination_sum(a2, 8)
