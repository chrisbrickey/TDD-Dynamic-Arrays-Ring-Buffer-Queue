require_relative 'node'

class BinarySearchTree

  attr_accessor :root, :length #delete length after test are developed

  def initialize
    @length = 0 #for test development ONLY, delete later
    @root = nil
  end

  def insert(el)
    new_node = Node.new(el)
    if @root
      if new_node.value < @root.value
        @root.left = new_node
      else
        @root.right = new_node
      end
    else
      @root = new_node
    end
  end



end
