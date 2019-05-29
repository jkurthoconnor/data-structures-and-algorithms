
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

=begin

BST         4
         2    5
      1    3
          
=end

Node = Struct.new(:value, :left, :right)

one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)
six = Node.new(6)
seven = Node.new(7)

four.left = two
four.right = five
two.left = one
two.right = three

six.left = four
six.right = seven

bst1 = four
bst2 = six

p max_depth(bst1)       # 3
p max_depth(bst2)       # 4
