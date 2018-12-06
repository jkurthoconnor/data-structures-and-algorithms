require 'minitest/autorun'
require_relative 'node'

class NodeTest < MiniTest::Test
  def setup
    @node_2 = Node.new(2)
    @node = Node.new(1, @node_2)
  end

  def test_object_exists_as_node
    assert(@node)
    assert_instance_of(Node, @node)
  end

  def test_node_next_exists
    assert(@node.next)
  end

  def test_next_must_be_node
    assert_raises(ArgumentError) do
      @node_2.next = 'hello'
    end
  end

  def test_default_next_is_nil
    assert_nil(@node.next.next)
    assert_nil(@node_2.next)
  end

  def test_node_has_correct_value
    assert_equal(1, @node.value)
  end

  def test_node_next_has_correct_value
    assert_equal(2, @node.next.value)
  end

  def test_value_can_be_set
    assert_equal(3, @node.value = 3)
  end

  def test_next_can_be_set
    @node_3 = Node.new(3)
    assert_equal(@node_3, @node_2.next = @node_3)
  end

end
