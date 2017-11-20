require_relative 'node'

class BinarySearchTree

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(el, tree_node=@root)

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
    else # el >= tree_node.value
      if tree_node.right
        insert(el, tree_node.right)
      else
        tree_node.right = Node.new(el)
      end
    end

  end

  def find(target, top_node=@root)
    return nil if top_node.nil?

    if top_node.value == target
      return top_node
    elsif target < top_node.value
      return find(target, top_node.left)
    else
      return find(target, top_node.right)
    end

  end

  def delete(target, top_node=@root)
    the_node_to_delete = find(target, top_node)
    return nil unless the_node_to_delete

    the_node_to_delete
  end

  # def print_tree
  #   print "root: #{@root.value}\n"
  #   print "l1: #{@root.left.value}   #{@root.right.value}\n"
  #   print "l2: #{@root.left.left.value}  #{@root.left.right.value} #{@root.right.left.value}  #{@root.right.right.value}\n"
  # end



end
