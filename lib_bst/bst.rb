require_relative 'node'

class BinarySearchTree

  attr_accessor :root, :length #delete length after test are developed

  def initialize
    @length = 0 #for test development ONLY, delete later
    @root = nil
  end

  def insert(el, tree_node=@root)

    # return BSTNode.new(value) if tree_node.nil?

    if (@root.nil?) && (tree_node == @root)
      @root = Node.new(el)
      return @root
    end

    if el < tree_node.value
      if tree_node.left
        insert(el, tree_node.left)
      else
        tree_node.left = Node.new(el)
      end
    else # new_node.value >= tree_node.value
      if tree_node.right
        insert(el, tree_node.right)
      else
        tree_node.right = Node.new(el)
      end
    end


  end

  def print_tree
    print "root: #{@root.value}\n"
    print "l1: #{@root.left.value}   #{@root.right.value}\n"
    print "l2: #{@root.left.left.value}  #{@root.left.right.value} #{@root.right.left.value}  #{@root.right.right.value}\n"
  end



end
