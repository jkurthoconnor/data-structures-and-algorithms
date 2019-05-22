=begin
 LeetCode 70. Climb Stairs

 You are climbing a stair case. It takes n steps to reach to the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

 Note: Given n will be a positive integer.

 Example 1:

 Input: 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps

 Example 2:

 Input: 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step


 IN: positive integer representing a step's distance from the bottom
     of the staircase

 OUT: integer representing number of distinct ways to climb from bottom to top

    CLIMBING RULES:
      - each stride can only cover 1 or 2 steps at a time
        - one can ascend using any combination of 1 or 2 steps

    DISTINCT WAYS RULES:
      - the number of distinct ways to any step (n) is determined by the number of
      distinct ways to the two steps immediately preceding it, because each of those     
      provides access to step n 
        - ways = ways to step n - 1 + ways to step n - 2

BASE CASE:
  - for step #1, there is only one distinct way to climb to it
     - 1 step path

  - for step #2, there are 2 distinct ways to climb to it
     - 1 step + 1 step
     - 2 steps at once

 return 1 if n is 1; return 2 if n is 2   

  BOTTOM UP APPROACH:
    seeking f(n)
    seed cache with the base case return values, 
    build up cache via iteration from last base case up to n
    return cache[n]

=end

# *** using a cache is overkill here because it stores only two values;
# but retained as a model ***

# TIME: O(N) SPACE: O(1)
# LeetCode: faster than 96%; less memory than 100%
def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2

  memo = {}
  memo[:min_one] = 1
  memo[:min_two] = 2

  (3..n).each do |step|
    memo[:min_two] = memo[:min_one] + memo[:min_two]
    memo[:min_one] = memo[:min_two] - memo[:min_one]
  end

  memo[:min_two]
end

p climb_stairs(1) # 1
p climb_stairs(2) # 2
p climb_stairs(3) # 3


