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
        new_node = Node.new(el)
        new_node.parent = tree_node
        tree_node.left = new_node
      end
    else # el >= tree_node.value
      if tree_node.right
        insert(el, tree_node.right)
      else
        new_node = Node.new(el)
        new_node.parent = tree_node
        tree_node.right = new_node
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


    the_parent = the_node_to_delete.parent
    side_for_deleting = the_parent.left == the_node_to_delete ? "left" : "right"


    if (the_node_to_delete.left.nil?) && (the_node_to_delete.right.nil?)
      if side_for_deleting == "left"
        the_parent.left = nil
      else
        the_parent.right = nil
      end
    elsif the_node_to_delete.left.nil?
      #pull right subtree up to replace the_node_to_delete
    elsif the_node_to_delete.right.nil?
      #pull left subtree up to replace the_node_to_delete
    else # node has two children
      #find the max of the left sub_tree
    end



    the_node_to_delete.parent = nil
    the_node_to_delete
  end

  # def print_tree
  #   print "root: #{@root.value}\n"
  #   print "l1: #{@root.left.value}   #{@root.right.value}\n"
  #   print "l2: #{@root.left.left.value}  #{@root.left.right.value} #{@root.right.left.value}  #{@root.right.right.value}\n"
  # end



end
