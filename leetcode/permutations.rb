=begin
understand problem:
  - id constraints
  - id dead-end cases
solve manually (by hand)
implement naive solution (manual solution)
optimize
  move success checking logic to branching logic

LeetCode Permutations 46

Given a collection of distinct integers, return all possible permutations.

Example:

Input: [1,2,3]
Output:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]


IN: array of distinct int
OUT: 2-d array of all permutations

RULES:
  permutation: ordering of members of a set; each member appears 1x

  all possible permutations:
    set in which every possible permutation appears 1x

CONSTRAINTS
  permutation has same length as original
  permutation has same elements as original
  permutation has no duplicates
  if the permutation occurs already in the result, it can't occur again

=end

# LeetCode: faster than 94%; less memory than 55%
def permute(nums)
  result = []
  find_permutations(nums, result)
  result
end

def find_permutations(nums, result, tmp = [])
  puts "#{"    " * result.size}f(nums=#{nums}, result=#{result}, tmp=#{tmp})"

  if (tmp.length == nums.length)
    result.push(tmp.clone)
  else
    nums.each do |n|
      next if tmp.include?(n)
      tmp.push(n)
      find_permutations(nums, result, tmp)

      tmp.pop
    end
  end
end

a1 = [1,2,3]
a2 = [1,3]

p permute(a1)
# p permute(a2)

