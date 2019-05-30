=begin
Leet Code 102. Binary Tree Level Order Traversal

PROBLEM:

Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example:
Given binary tree [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7

return its level order traversal as:

[
  [3],
  [9,20],
  [15,7]
]


=end


# LeetCode: faster than 97%; less memory than 100%
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

p level_order(tree)


