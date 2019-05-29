=begin
LeetCode 98. Validate Binary Search Tree

Given a binary tree, determine if it is a valid binary search tree (BST).

Assume a BST is defined as follows:

    The left subtree of a node contains only nodes with keys less than the node's key.
    The right subtree of a node contains only nodes with keys greater than the node's key.
    Both the left and right subtrees must also be binary search trees.



Example 1:

    2
   / \
  1   3

Input: [2,1,3]
Output: true

Example 2:

    5
   / \
  1   4
     / \
    3   6

Input: [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.

#####

IN: tree root
OUT: boolean

RULES:
  valid BST: a tree whose left subtree contains only nodes with values < its own value
             &&     whose right subtree contains only nodes with values > its own value
             &&     whose left subtree is also a valid BST
             &&     whose right subtree is also a valid BST

  RECURSIVE DEFINITION OF PROBLEM: nodeA.val > nodeA.left.val && nodeA.val < nodeA.right.val && 
              isBST(nodeA.left) && isBST(nodeA.right)
=end

# LeetCode: faster than 94%; less memory than 99%
def is_valid_bst(root)
  bst_helper(root)
end

def bst_helper(root, low = -Float::INFINITY, high = Float::INFINITY)
  return true if root.nil?

  val = root.val

  return false unless (val < high && val > low)

  left_is_valid = bst_helper(root.left, low, val)
  right_is_valid = bst_helper(root.right, val, high)

  left_is_valid && right_is_valid
end
