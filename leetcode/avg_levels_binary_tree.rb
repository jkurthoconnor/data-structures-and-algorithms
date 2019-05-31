=begin
Leet Code 637. Average of Levels in a Binary Tree

PROBLEM:
Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.

Example 1:

Input:
    3
   / \
  9  20
    /  \
   15   7
Output: [3, 14.5, 11]

Explanation:
The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].

Note:
    The range of node's value is in the range of 32-bit signed integer.

ALGO:
  use level_order to return 2-d array of levels
  map each level to its average
=end





# LeetCode: faster than 95%; less memory than 100%
def average_of_levels(root)
  level_order(root).map do |level|
    level.sum / level.size.to_f
  end
end

def level_order(root)
  return [] if root.nil?

  levels = []
  queue = [root]

  while !queue.empty?
    level_size = queue.size
    level = []

    level_size.times do
      current = queue.shift
      level << current.val

      queue << current.left if current.left
      queue << current.right if current.right
    end

    levels << level
  end

  levels
end



Node = Struct.new(:val, :left, :right)

three = Node.new(3)
nine = Node.new(9)
twenty = Node.new(20)
fifteen = Node.new(15)
seven = Node.new(7)

three.left = nine
three.right = twenty
twenty.left = fifteen
twenty.right = seven

tree = three

p average_of_levels(tree)


