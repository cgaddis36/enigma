require './lib/node'

class LinkedList
  attr_reader :head, :count, :string, :tail

  def initialize
    @head = nil
    @tail = nil
    @count = 0
    @string = ""
  end

  def append(node)
    @count += 1
    if @head.nil?
      @head = Node.new(node)
      @tail = @head
      @string = "The #{@head.surname} family"
    else
      @tail.next_node = Node.new(node)
      @tail = @tail.next_node
      @string = @string + ", followed by the #{@tail.surname} family"
    end
  end

  def to_string
    require "pry"; binding.pry
    @string
  end
end
