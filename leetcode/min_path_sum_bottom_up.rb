=begin
LeetCode 64. Minimum Path Sum

PROBLEM:

Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

Note: You can only move either down or right at any point in time.

Example:

Input:
[
  [1,3,1],
  [1,5,1],
  [4,2,1]
]
Output: 7
Explanation: Because the path 1→3→1→1→1 minimizes the sum.

IN: grid, 2-d array
OUT: integer representing the minimum path from grid[0][0] to the  bottom right, 
     grid[m][n]

RULES
 CLARIFICATION / RULES
   Path: a route from an arbitrary cell to another following rules of motion
         RULES FOR MOTION:
           one can only move down or right
             move down: maintain current column address, advance 1 row
             move right: maintain current row address, advance 1 column

        RULES FOR CORDINATES:
          a grid of 0-indexed rows and columns
          start: top left, i.e. grid[0][0]  
          stop: bottom right, i.e. grid[grid.length][grid[0].length]

          PATH SUM:
            - the sum of all values in the cells used in a given path, including
            the start and stop cell values

RECURSIVE MODEL
   *** Access to any cell is determined by access to the cell one column to the
       left and access to the cell one row above ***

       MINIMUM PATH SUM: 
           the lesser of min_path_sum(cell left) && min_path_sum(cell above)
           plus the value of the current cell

      BASE CASES:
        any cell in row0 can only be accessed by cells between it and grid[0][0]
        any cell in column0 can only be accessed by cells between it and grid[0][0]

        if row == 0, return the sum of grid[0][0] .. grid[0][current cell col]
        if column == 0, return the sum of grid[0][0] .. grid[current cell row][0]

=end

# TIME: O(row * col); SPACE: O(row * col)
# LeetCode: faster than 11%; less memory than 10%
def min_path_sum(grid)
  last_row = grid.length - 1
  last_col = grid[0].length - 1
  memo = {}

  (0..last_row).each do |r|
    (0..last_col).each do |c|
      if r == 0 && c == 0
        memo[[r,c]] =  grid[r][c]
      elsif r == 0
        memo[[r,c]] =  row_sum(grid, c)
      elsif c == 0
        memo[[r,c]] = col_sum(grid, r)
      else
        memo[[r,c]] = [ memo[[r - 1, c]], memo[[r, c - 1]] ].min + grid[r][c]
      end
    end
  end

  memo[[last_row,last_col]]
end

def row_sum(grid, column)
  top_row = grid[0]
  top_row[0..column].sum
end

def col_sum(grid, row)
  current_row = 0
  sum = 0

  while current_row <= row
    sum += grid[current_row][0]
    current_row += 1
  end

  sum
end

p min_path_sum([ [1,3,1], [1,5,1], [4,2,1] ])
