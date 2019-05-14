# LeetCode 54. Spiral Matrix
#
# Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.

# I: 2D array of (arrays of) integer
# O: flattened array representing all elements in input array in "spiral order"
#
#   clarification "spiral order"
#                 first array: 0 - end
#                 middle array: end
#                 final array: end - 0
#                 middle array: 
#
#
# D: array to receive integers in spiral order
# A: 
#   push array0 elements into holder
#   ~~push last element into holder from each array of idx1 to idx M - 2
#   push arrayidx M -1 (in reverse) into holder
#   
#
#Example 1:

#Input:
#[
# [ 1, 2, 3 ],
# [ 4, 5, 6 ],
# [ 7, 8, 9 ]
#]
#Output: [1,2,3,6,9,8,7,4,5]

#Example 2:

#Input:
#[
#  [1, 2, 3, 4],
#  [5, 6, 7, 8],
#  [9,10,11,12]
#]
#Output: [1,2,3,4,8,12,11,10,9,5,6,7]
##
#
# model: 1) mark F as go
#        2) go-right(start, stop)
#           go-down(start, stop)
#           go-left(start, stop)
#           go-up(start, stop)
#

def spiral_matrix(matrix)
  return [] if matrix.empty?
  spiral = []

  spiral.push(matrix.shift)

  while matrix.any?
    matrix = rotate_matrix_left(matrix)
    spiral.push(matrix.shift)
  end

  spiral.flatten
end

def rotate_matrix_left(matrix)
  rotated = []

  while matrix[0].any?
    column = []

    matrix.each do |row|
      column.push(row.pop)
    end

    rotated.push(column)
  end

  rotated
end


p spiral_matrix([ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ])
p spiral_matrix([ [1, 2, 3, 4], [5, 6, 7, 8], [9,10,11,12] ])
