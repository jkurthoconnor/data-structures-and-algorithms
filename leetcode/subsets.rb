=begin
LeetCode 78. Subsets

Given a set of distinct integers, nums, return all possible subsets (the power set).

Note: The solution set must not contain duplicate subsets.

Example:

Input: nums = [1,2,3]
Output:
[
  [3],
  [1],
  [2],
  [1,2,3],
  [1,3],
  [2,3],
  [1,2],
  []
]




=end


def subsets(nums)
  result = [[]]
  # helper1(nums, result)
  helper2(nums, result)
  result
end

# helper1 uses advancing indices in recursive calls to avoid dupes
# LeetCode: faster than 14%; less memory than 96%
def helper1(nums, result, candidate = [], idx = 0)

  if !result.include?(candidate)
    result.push(candidate.clone)
  end 

  i = idx

  while i < nums.size
    candidate.push(nums[i])
    helper1(nums, result, candidate, i + 1)
    candidate.pop

    i += 1
  end
end

# helper2 uses constraint logic to avoid pushing dupes to result
# LeetCode: time limit exceeded
def helper2(nums, result, candidate = [])
  # puts "f(#{nums}, result=#{result}, candidate=#{candidate})"
  if !result.map(&:sort).include?(candidate.sort)
    result.push(candidate.clone)
  end

  nums.each do |n|
    next if candidate.include?(n)
    candidate.push(n)
    helper2(nums, result, candidate)
    candidate.pop
  end
end


a1 = [1,2,3]
p subsets(a1)
a2 = [1,2]
# p subsets(a2)
