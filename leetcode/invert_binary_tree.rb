=begin
LeetCode 226. Invert Binary Tree

PROBLEM:
Invert a binary tree.

Example:

Input:

     4
   /   \
  2     7
 / \   / \
1   3 6   9

Output:

     4
   /   \
  7     2
 / \   / \
9   6 3   1



IN: binary tree/root
OUT: root for same tree, inverted

RULES / CLARIFICATIONS:

A is an inversion of B when every node under A has its relative position vis-a-vis its parent swapped in B
  
RECURSIVE FORMULATION:
  inverted tree = root && inverted left                         && inverted right
                          root && inverted left && inverted right

BASE CASE:
  return nil when root is nil

NB: no need to worry about passing values up through the stack or combining returns;

    *** Problem is strickly one of divide(left - right) and mutate ***
    

=end
require_relative "../tree_traversal_patterns"

# LeetCode: faster than 95%; less memory than 100%
def invert_tree(root)
  return nil if root.nil?

  invert_tree(root.left)
  invert_tree(root.right)

  tmp = root.left
  root.left = root.right
  root.right = tmp

  root
end

Node = Struct.new(:val, :left, :right)

one = Node.new(1)
one2 = Node.new(1)
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

four.left = two
four.right = seven
two.left = one
two.right = three
seven.left = six
seven.right = nine


tree = four
traverse_breadth_first(four)
invert_tree(tree)
traverse_breadth_first(four)

