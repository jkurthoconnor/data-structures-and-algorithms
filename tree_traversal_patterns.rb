
# DEPTH FIRST TRAVERSAL

# inorder traversal of a BST visits nodes in non-descending order
# for non-ascending order, reverse left and right traversals
def traverse_inorder(root)
  return nil if root.nil?

  traverse_inorder(root.left)
  p root.val
  traverse_inorder(root.right)
end


# used to copy tree; also for prefix expression of expression tree
def traverse_preorder(root)
  return nil if root.nil?

  p root.val
  traverse_preorder(root.left)
  traverse_preorder(root.right)
end

# used to delete tree; also for postfix expression of expression tree
def traverse_postorder(root)
  return nil if root.nil?
  
  traverse_postorder(root.left)
  traverse_postorder(root.right)
  p root.val
end

# LEVEL ORDER TRAVERSAL

# breadth first
def traverse_breadth_first(root)
  height = height(root)

  (1..height + 1).each do |i|
    print_level(root, i)
  end
end

def print_level(root, level)
  return nil if root.nil?

  if level == 1
    p root.val
  elsif level > 1
    print_level(root.left, level - 1)
    print_level(root.right, level - 1)
  end
end

def height(root)
  return 0 if root.nil?

  left_height = height(root.left)
  right_height = height(root.right)

  if left_height > right_height
    return left_height + 1
  else
    return right_height + 1
  end
end


# Node = Struct.new(:val, :left, :right)

# one = Node.new(1)
# two = Node.new(2)
# three = Node.new(3)
# four = Node.new(4)
# five = Node.new(5)

# =begin

# BST         4
#          2    5
#       1    3

# =end
# four.left = two
# four.right = five
# two.left = one
# two.right = three
# bst = four

# # traverse_inorder(bst) # 1,2,3,4,5
# # traverse_preorder(bst) #  4,2,1,3,5
# # traverse_postorder(bst)  # 1,3,2,5,4

# traverse_breadth_first(bst)  # 4,2,5,1,3
