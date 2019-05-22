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
require 'pry'

def min_path_sum(grid)
  end_row = grid.length - 1
  end_col = grid[0].length - 1

  min_finder(grid, end_row, end_col)
end

def min_finder(grid, row, col, memo = {})
  if row == 0 && col == 0
    return grid[0][0]
  elsif row == 0
    return row_sum(grid, col)
  elsif col == 0
    return column_sum(grid, row)
  end

  min_up   = memo[[row - 1, col]] || min_finder(grid, row - 1, col, memo)
  min_left = memo[[row, col - 1]] || min_finder(grid, row, col - 1, memo)

  min_path = (min_up < min_left) ? min_up : min_left
  min      = min_path + grid[row][col]

  memo[[row][col]] = min

  min
end

def row_sum(grid, column)
  top_row = grid[0]
  top_row[0..column].sum
end

def column_sum(grid, row)
  current_row = 0
  sum = 0

  while current_row <= row
    sum += grid[current_row][0]
    current_row += 1
  end

  sum
end

p min_path_sum([ [1,3,1], [1,5,1], [4,2,1] ])
