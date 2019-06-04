=begin
LeetCode 77. Combinations

Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

Example:

Input: n = 4, k = 2
Output:
[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]

IN: int n, representing max included value in range (1..n)
    int k, representing the size of each combination to include


OUT: 2-d array of all possible k-sized combinations of numbers in (1..n)

RULE:
  a combination is determined by its elements, not their order;
    - [1,2] is equivalent to [2,1]


ALGORITHM:

 approach as a subset problem of all int (1..n), 
 only push permutation of k size


=end

def combine(n,k)
  result = []

  # helper(n,k,result)
  helper1(n,k,result)
  result
end

# uses constraints to block including duplicate results
# LeetCode time limit exceeded
def helper(max, size, result, tmp = [])
  # puts "f(max=#{max}, size=#{size}, result=#{result}, tmp=#{tmp})"

  max.times do |n|
    next if tmp.include?(n + 1)
    tmp.push(n + 1)

    if tmp.size == size && !result.map(&:sort).include?(tmp.sort)
      result.push(tmp.clone)
    end

    helper(max, size, result, tmp)
    tmp.pop
  end
end

# advances number on recursive to prevent _consideration_ of duplicates
# LeetCode: faster than 54%; less memory than 40%
def helper1(max, size, result, tmp = [], start = 1)

  (start..max).each do |n|
    tmp.push(n)

    if tmp.size == size
      result.push(tmp.clone)
    end

    helper1(max, size, result, tmp, n + 1)
    tmp.pop
  end
end

p combine(4,2)
