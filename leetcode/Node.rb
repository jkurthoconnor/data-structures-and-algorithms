class Node
  attr_accessor :val, :next

  def initialize(val, nxt)
    @val = val || nil
    @next = nxt || nil
  end

  def self.make_list(values)
    previous = nil

    values.reverse_each do |val|
      current = self.new(val, previous)
      previous = current
    end

    previous
  end
end
