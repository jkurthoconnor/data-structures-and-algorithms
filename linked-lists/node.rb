class Node
  attr_reader :next, :value

  def initialize(value, n=nil)
    @value = value
    @next = n
  end

  def next=(n)
    if n.instance_of?(Node) && (n != self)
      @next = n
    else
      raise(ArgumentError, "Next must be a Node, and cannot be self")
    end
  end

  def value=(val)
    @value = val
  end
end
