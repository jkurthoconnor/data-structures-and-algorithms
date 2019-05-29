=begin
LeetCode 110. Balanced Binary Tree

PROBLEM
Given a binary tree, determine if it is height-balanced.

For this problem, a height-balanced binary tree is defined as:

    a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example 1:

Given the following tree [3,9,20,null,null,15,7]:

    3
   / \
  9  20
    /  \
   15   7

Return true.

Example 2:

Given the following tree [1,2,2,3,3,null,null,4,4]:

       1
      / \
     2   2
    / \
   3   3
  / \
 4   4

Return false.

IN: root node
OUT: boolean

Binary Tree Recursive Structure: a BT is a root & left BT & right BT

Binary Tree with Balanced Height:
  - BT in which the depth of two subtrees of every node never differ by more than 1

  - RECURSION:
      *** a balanced height binary tree is a binary tree whose left and right
          trees are also balanced ***

      is_balanced(root) = is_balanced(root.left) && is_balanced(root.right)

      for any node, it is balanced if: (height(node.left) - height(node.right)).abs <= 1

=end

# LeetCode: faster than 7%; less memory than 100%

def is_balanced(root)
  return true if root.nil?

  left_balanced  = is_balanced(root.left)
  right_balanced = is_balanced(root.right)

  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)

  left_balanced && right_balanced && ((left_depth - right_depth).abs <= 1)
end

def max_depth(root)
  return 0 if root.nil?

  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)

  if left_depth > right_depth
    return left_depth + 1
  else
    return right_depth + 1
  end
end

Node = Struct.new(:val, :left, :right)
one = Node.new(1)
two = Node.new(2)
two2 = Node.new(2)
three = Node.new(3)
three2 = Node.new(3)
four = Node.new(4)
four2 = Node.new(4)
five = Node.new(5)
six = Node.new(6)
seven = Node.new(7)
nine = Node.new(9)
twenty = Node.new(20)
fifteen = Node.new(15)

# three.left = nine
# three.right = twenty
# twenty.left = fifteen
# twenty.right = seven

# tree1 = three

one.left = two
one.right = two2
two.left = three
two.right = three2
three.left = four
three.right = four2

tree2 = one


# p is_balanced(tree1)
p is_balanced(tree2)
