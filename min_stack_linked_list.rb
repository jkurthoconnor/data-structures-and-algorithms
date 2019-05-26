# Stack implemented on a linked-list

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

s = MinStack.new

s.push(12)
s.push(0)
s.push(-1)
p s.get_min  # -1
s.pop
p s.top      # 0 

s.pop
p s.top      # 12

s.push(0)
s.push(-2)
p s.top      # -2
p s.get_min  # -2

p s
