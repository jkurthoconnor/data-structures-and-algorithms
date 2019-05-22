# LeetCode 62 Unique Paths
#
# PROBLEM:
=begin
A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

How many possible unique paths are there?#

Note: m and n will be at most 100.

Example 1:

Input: m = 3, n = 2
Output: 3
Explanation:
From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
1. Right -> Right -> Down
2. Right -> Down -> Right
 3. Down -> Right -> Right

 Example 2:

 Input: m = 7, n = 3
 Output: 28

 IN: m, n integers
 OUT: single integer
 
 CLARIFICATION / RULES
   Path: a route from an arbitrary cell to another following rules of motion
         RULES FOR MOTION:
           one can only move down or right
             move down: maintain current column address, advance 1 row
             move right: maintain current row address, advance 1 column

         RULES FOR CORDINATES:
          a matrix of 1-indexed rows and columns
          input cordinates represent the bottom right cell


   *** The number of paths to any cell: is the sum of the paths to that cell's points-of-entry ***
       e.g. paths(row,col) = paths(row - 1, col) + paths(row, col - 1)

 BASE CASE:
   robot is on any cell in row 1 or col 1  (e.g. top row, left column)

BOTTOM UP APPROACH:
  seeking f(row, col)
  seed cache with the base case return values, 
  build up cache via iteration from last base case up to n
  return cache[n]

=end


# TIME: O(row * col); SPACE: O(row * col)
# LeetCode: faster than 30%; less memory than 35%
def unique_paths(row, col)
  return 1 if row == 1 || col == 1
  memo = {}

  (1..row).each do |r|
    (1..col).each do |c|
      if r == 1 || c == 1
        memo[[r,c]] = 1
      else
        memo[[r,c]] = memo[[r - 1, c]] + memo[[r, c - 1]]
      end
    end
  end
 
  memo[[row, col]]
end

p unique_paths(3,2) # 3
p unique_paths(7,3) # 28
