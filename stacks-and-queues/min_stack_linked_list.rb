# Stack implemented on a linked-list

 # VERSION 1. tracking min value with a second, perpetually sorted stack
 # that mirrors the values currently in the stack
 
 # Every pop and push operation is O(N) time due to sorting / placing values
 # in @min stack

=begin
Node = Struct.new(:value, :next)

class MinStack
  def initialize
    @dumb_top = Node.new
    @min = []
    @size = 0
  end

  def push(val)
    new_item = Node.new(val, @dumb_top.next)
    @dumb_top.next = new_item
    @size += 1
    set_min_stack_val(val)
  end

  def pop
    target = @dumb_top.next

    if target
      @dumb_top.next = target.next
      @size -= 1

      target = target.value
      remove_min_stack_val(target)
    end

    target
  end

  def top
    @dumb_top.next ? @dumb_top.next.value : nil
  end

  def get_min
    @min.last
  end

  private

  def set_min_stack_val(val)
    tmp = []

    if !@min.empty? && (val <= @min.last)
      @min << val
    else
      expose_val(tmp, val)
      @min.push(val)
      restore_sorted_stack(tmp)
    end
  end

  def remove_min_stack_val(val)
    tmp = []

    if val == @min.last
      @min.pop
    else
      expose_val(tmp)
      tmp.pop
      restore_sorted_stack(tmp)
    end
  end

  def expose_val(tmp, val)
    if @min.empty?
      @min.push(val)
    else
      until @min.last > val
        tmp.push(@min.pop)
      end
    end
  end

  def restore_sorted_stack(tmp)
    until tmp.empty?
      @min.push(tmp.pop)
    end
  end
end
=end

# VERSION 2: store 'current' minimum value in each element;
#           because the stack maintains order, any currently top
#           node will hold a variable with the min value of the stack beneath it

MinNode = Struct.new(:value, :next, :min)

class MinStack
  def initialize
    @dumb_top = MinNode.new
    @size = 0
  end

  def push(val)
    new_item = MinNode.new(val, @dumb_top.next)
    set_min(new_item)

    @dumb_top.next = new_item
    @size += 1
  end

  def pop
    target = @dumb_top.next

    if target
      @dumb_top.next = target.next
      @size -= 1

      target = target.value
    end

    target
  end

  def top
    top_node(:value)
  end

  def get_min
    top_node(:min)
  end

  private

  def set_min(node)
    prev_min = @dumb_top.next ? @dumb_top.next.min : nil

    if !prev_min || prev_min > node.value
      node.min = node.value
    else
      node.min = prev_min
    end
  end

  def top_node(property)
    return nil unless @dumb_top.next

    if property == :value
      @dumb_top.next.value
    else
      @dumb_top.next.min
    end
  end
end

=begin
s = MinStack.new

s.push(12)
s.push(0)
s.push(-1)
p s.get_min  # -1
s.pop
p s.top      # 0 

s.pop
p s.top      # 12
s.pop
p s.get_min

s.push(0)
s.push(-2)
p s.top      # -2
p s.get_min  # -2

p s
=end
