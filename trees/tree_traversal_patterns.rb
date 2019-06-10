
# DEPTH-FIRST RECURSIVE PATTERNS
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

# DEPTH-FIRST ITERATIVE PATTERNS

# preorder with return of values 
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


# BREADTH-FIRST / LEVEL ORDER TRAVERSAL RECURSIVE PATTERN

# breadth first recursive
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

# BREADTH-FIRST ITERATIVE PATTERNS

# simple traversal
def breadth_first_with_queue(root)
  result = []
  queue = [root]

  while !queue.empty?
    current = queue.shift
    result.push(current.val)
    queue.push(current.left) if current.left
    queue.push(current.right) if current.right
  end

  result
end

# traversal with map of each level in sub-array
def breadth_first_level_mapping_with_queue(root)
  levels = []
  queue = [root]

  while !queue.empty?
    level_size = queue.size
    level = []

    level_size.times do
      current = queue.shift
      level.push(current.val)
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
    end

    levels.push(level)
  end

  levels
end


Node = Struct.new(:val, :left, :right)

one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)


# BST         4
#           2    5
#        1    3

four.left = two
four.right = five
two.left = one
two.right = three
bst = four

# # traverse_inorder(bst) # 1,2,3,4,5
# # traverse_preorder(bst) #  4,2,1,3,5
# # traverse_postorder(bst)  # 1,3,2,5,4

# p traverse_breadth_first(bst)  # 4,2,5,1,3
# p breadth_first_level_mapping_with_queue(bst)
p breadth_first_with_queue(bst)
