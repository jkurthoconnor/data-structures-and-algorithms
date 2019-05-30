=begin
LeetCode: 129. Sum Root to Leaf Numbers

PROBLEM:
Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.

An example is the root-to-leaf path 1->2->3 which represents the number 123.

Find the total sum of all root-to-leaf numbers.

Note: A leaf is a node with no children.

Example:

Input: [1,2,3]
    1
   / \
  2   3
Output: 25
Explanation:
The root-to-leaf path 1->2 represents the number 12.
The root-to-leaf path 1->3 represents the number 13.
Therefore, sum = 12 + 13 = 25.

Example 2:

Input: [4,9,0,5,1]
    4
   / \
  9   0
 / \
5   1
Output: 1026
Explanation:
The root-to-leaf path 4->9->5 represents the number 495.
The root-to-leaf path 4->9->1 represents the number 491.
The root-to-leaf path 4->0 represents the number 40.
Therefore, sum = 495 + 491 + 40 = 1026.



CLARIFICATION:
  root-to-leaf paths are 'written' by following preorder traversal pattern

MODEL:
    - values placed in current_path stack as first encountered as root
    - just before traversal (via stacks) pops the traversal-management-stack,
      form a number from the current path stack
    - pop from path stack; pop new current from traversal-management-stack
=end

# LeetCode: faster than 100%; less memory than 100%
def sum_numbers(root)
  numbers = []
  paths = []
  sum_numbers_helper(root, numbers, paths)
  numbers.sum
end


def sum_numbers_helper(root, numbers, paths)
  return true if root.nil?

  paths << root.val

  left =  sum_numbers_helper(root.left, numbers, paths)
  right = sum_numbers_helper(root.right, numbers, paths)

  if left && right
    numbers << paths.map(&:to_s).join.to_i
  end

  paths.pop

  return
end




Node = Struct.new(:val, :left, :right)

zero = Node.new(0)
one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)
nine = Node.new(9)

# one.left = two
# one.right = three

# t1 = one
#

four.left = nine
four.right = zero
nine.left = five
five.left = six
nine.right = one

t2 = four

# p sum_numbers(t1)
p sum_numbers(t2)
