require 'minitest/autorun'
require_relative 'stack'

class StackTest < MiniTest::Test
  def setup
    @stack = Stack.new
  end

  def test_stack_exists
    assert(@stack)
  end

  def test_instance_of_stack
    assert_instance_of(Stack, @stack)
  end

  def test_push
    assert_includes(@stack.push(1), 1)
  end

  def test_pop
    @stack.push(2)
    assert_equal(2, @stack.pop)
    assert_nil(@stack.pop)
  end

  def test_peek
    1.upto(4) do |n|
      @stack.push(n)
    end

    assert_equal(4, @stack.peek)
  end
end



