=begin
LeetCode 100. Same Tree

PROBLEM:
Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.

Example 1:

Input:     1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

Output: true

Example 2:

Input:     1         1
          /           \
         2             2

        [1,2],     [1,null,2]

Output: false

Example 3:

Input:     1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

Output: false

########

IN: tree root 1; tree root 2
OUT: boolean

RULES:
  same(treeA, treeB) iff they are structurally identical and nodes have same value
  
  RECURSIVE DEFINITION of 'SAME TREE'
    same = same roots && same left trees && same right trees

  test for sameness: traverse both trees simultaneously and compare values
=end

# LeetCode: faster than 96%; less memory than 86%
def is_same_tree(treeA, treeB)
  return true if treeA.nil? && treeB.nil?
  return false if treeA.nil? || treeB.nil?

  treeA.val == treeB.val &&
  is_same_tree(treeA.left, treeB.left) &&
  is_same_tree(treeA.right, treeB.right)
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

one.left = two
one.right = three
t1 = one

one2.left = two2
one2.right = three2
t2 = one2

four.left = five
four.right = six
six.left = seven
t3 = four

p is_same_tree(t1, t3)
