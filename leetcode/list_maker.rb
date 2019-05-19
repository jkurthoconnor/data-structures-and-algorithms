Node = Struct.new(:val, :next)

def make_list(values)
  next_node = nil

  values.reverse_each do |val|
    node = Node.new(val, next_node)
    next_node = node
  end

  next_node
end
