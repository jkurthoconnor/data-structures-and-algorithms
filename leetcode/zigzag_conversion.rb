require 'pry'
# 6. [ZigZag Conversion](https://leetcode.com/problems/zigzag-conversion/)
#
#
#Problem Statement:
#
#The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

#P   A   H   N
#A P L S I I G
#Y   I   R

#And then read line by line: "PAHNAPLSIIGYIR"

#Write the code that will take a string and make this conversion given a number of rows:

#string convert(string s, int numRows);

#Example 1:

#Input: s = "PAYPALISHIRING", numRows = 3
#Output: "PAHNAPLSIIGYIR"

#Example 2:

#Input: s = "PAYPALISHIRING", numRows = 4
#Output: "PINALSIGYAHRPI"
#Explanation:

#P     I    N
#A   L S  I G
#Y A   H R
#P     I

##
# PEDAC
# in: plain text string; number of rails/rows
# out: encyrpted string
#
# rules: 
#   encryption by inscribing chars in a zig-zag pattern along given num. of rails/rows
#   pattern:
#     input string distrubuted along given num of rows
#       first column (idx) takes one char each row; top to bottom row (1..n) each gets char
#       next char goes to idx 2 at n-1; all others are blank (null/undefined?)
#       next char goes to idx 3 at n-2; all others are blank
#       next char goes to idx 3 at n-3; << cycle until row is 1
#
#

def convert(str, rows)
  return str if rows.eql?(1)

  matrix = Array.new(rows) { |_| []}
  move_down = true
  r, c = 0, 0

  str.each_char do |char|
    matrix[r][c] = char

    if r.eql?(rows - 1) || (r.eql?(0) && !move_down)
      move_down = !move_down
    end

    if move_down
      r += 1
    else
      r -= 1
      c += 1
    end
  end

  matrix.flatten.join
end
