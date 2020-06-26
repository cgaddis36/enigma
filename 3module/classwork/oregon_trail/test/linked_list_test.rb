require './lib/linked_list'
require 'minitest/pride'
require 'minitest/autorun'

class LinkedListTest < Minitest::Test

  def setup
    @list = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @list
  end

  def test_it_has_attributes
    assert_nil @list.head
  end

  def test_list
    @list.append("West")
    assert_instance_of LinkedList, @list
    assert_instance_of Node, @list.head
    assert_nil @list.head.next_node
  end

  def test_list_count
    @list.append("West")
    assert_equal 1, @list.count
  end

  def test_list_to_string
    @list.append("West")
    assert_equal "The West family", @list.to_string
  end

  def test_rhodes_family
    @list.append("Rhodes")
    assert_instance_of Node, @list.head
    assert_nil @list.head.next_node
    @list.append("Hardy")
    assert_instance_of Node, @list.head.next_node
    assert_equal "Hardy", @list.head.next_node.surname
    assert_equal 2, @list.count
    assert_equal "The Rhodes family, followed by the Hardy family", @list.to_string
    @list.append("Smith")
    assert_equal "The Rhodes family, followed by the Hardy family, followed by the Smith family", @list.to_string
  end
end
# > require "./lib/linked_list"
# > list = LinkedList.new
# > list.append("Brooks")
# => <Node @surname="Brooks" @next_node=nil #5678904567890>
# > list.to_string
# => "The Brooks family"
# > list.append("Henderson")
# => <Node @surname="Henderson" @next_node=nil #5678904567890>
# > list.prepend("McKinney")
# => <Node @surname="McKinney" @next_node=<Node @surname="Brooks" ... > #5678904567890>
# > list.to_string
# => "The McKinney family, followed by the Brooks family, followed by the Henderson family"
# > list.count
# => 3
# > list.insert(1, "Lawson")
# => <Node @surname="Lawson" @next_node=<Node @surname="Brooks" ... > #5678904567890>
# > list.to_string
# => "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family"
