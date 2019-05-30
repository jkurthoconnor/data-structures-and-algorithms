=begin
LeetCode 144. Binary Tree Preorder Traversal

PROBLEM:
Given a binary tree, return the preorder traversal of its nodes' values.

Example:

Input: [1,null,2,3]
   1
    \
     2
    /
   3

Output: [1,2,3]

Follow up: Recursive solution is trivial, could you do it iteratively?


=end

# LeetCode: faster than 100%; less memory than 100%
# recursive solution
# NB: initializing and returning values from wrapper, not from helper, sped up
# from 79% to 100%
def preorder_traversal_recursive(root)
  values = []
  preorder_value_catcher(root, values)
  values
end

def preorder_value_catcher(root, values)
  return nil if root.nil?

  values << root.val
  preorder_value_catcher(root.left, values)
  preorder_value_catcher(root.right, values)
end

# LeetCode: faster than 97%; less memory than 99%
def preorder_traversal(root)
  return [] if root.nil?

  values = []
  stack = ["padding"]
  current = root

  while !stack.empty?
    values << current.val
    stack << current.right if current.right
    if current.left
      current = current.left
    else
      current = stack.pop
    end
  end

  values
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


=begin
        1
      2   2
    3  4 4  3

=end

one.left = two
one.right = two2
two.left = three
two.right = four
two2.left = four2
two2.right = three2

symtree = one

# one.left = two
# one.right = two2
# two.right = three
# two2.right = three2

# asymtree = one

# p is_symmetric(asymtree)
p preorder_traversal(symtree)


