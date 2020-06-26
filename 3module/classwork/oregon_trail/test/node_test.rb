require './lib/node'
require 'minitest/pride'
require 'minitest/autorun'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("Burke")
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_has_attributes
    assert_equal "Burke", @node.surname
    assert_nil @node.next_node
  end
end
