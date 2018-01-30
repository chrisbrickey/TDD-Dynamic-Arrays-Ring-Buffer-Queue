require_relative 'node'

class BalancedBST

  attr_accessor :root


  def initialize
    @root = nil
  end

  def rebalance_array(original_arr, sorted_arr=[])
    size = original_arr.length
    return [] if size <= 0

    mid = size / 2
    sorted_arr << original_arr[mid]

    lefty = original_arr[0...mid]
    rebalance_array(lefty, sorted_arr)

    righty = original_arr[(mid + 1)..-1]
    rebalance_array(righty, sorted_arr)

    sorted_arr
  end

  def rebalance_tree
    if !is_balanced?
      print "inside rebalance_tree conditional===========\n"
      rebalanced_arr = rebalance_array(traverse_in_order)
      @root = Node.new(rebalanced_arr.shift)
      rebalanced_arr.each { |val| insert(val) }
    else
      print "did not rebalance because not unbalanced"
    end
  end

  #does not work for trees where @root == nil
  def traverse_in_order(node = @root, sorted_arr=[])

    if node.left
      traverse_in_order(node.left, sorted_arr)
    end

    sorted_arr << node.value

    if node.right
      traverse_in_order(node.right, sorted_arr)
    end

    sorted_arr
  end


  def insert(el)

    insert_recursively(el)

    if !is_balanced?
      # rebalance_tree
      
      print "THIS IS NOT BALANCED SO HERE WE GO REBALANCING\n"
      existing_sorted_arr = traverse_in_order.dup
      print "existing_sorted_arr: #{existing_sorted_arr}\n"
      rebalanced_arr = rebalance_array(existing_sorted_arr)
      print "rebalanced_arr: #{rebalanced_arr}\n"

      @root = nil
      rebalanced_arr.each { |val| insert_recursively(el) }
    end

  end

  def insert_recursively(el, tree_node=@root)

    if (@root.nil?) && (tree_node == @root)
      @root = Node.new(el)
      return @root
    end

    if el < tree_node.value
      if tree_node.left
        insert_recursively(el, tree_node.left)
      else
        new_node = Node.new(el)
        new_node.parent = tree_node
        tree_node.left = new_node
      end
    else # el >= tree_node.value
      if tree_node.right
        insert_recursively(el, tree_node.right)
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
    the_node_to_delete = find(target, top_node) #grabs the target but gives no info on location within tree and relative to its parent
    return nil if the_node_to_delete.nil?

    #find where in the tree the target is
    the_parent = the_node_to_delete.parent
    what_we_are_deleting = nil
    if the_parent.nil?
      what_we_are_deleting = "root"
    elsif the_node_to_delete.value < the_parent.value
      what_we_are_deleting = "left"
    else
      what_we_are_deleting = "right"
    end

    # target has no children so remove from tree and return early
    if (the_node_to_delete.left.nil?) && (the_node_to_delete.right.nil?)
      case what_we_are_deleting
      when "root" #the root was the only node in the tree
        @root = nil
      when "left"
        the_parent.left = nil
      when "right"
        the_parent.right = nil
      end

      the_node_to_delete.parent = nil
      return the_node_to_delete
    end


    # target has one child
    if the_node_to_delete.left.nil? || the_node_to_delete.right.nil?
      replacement_node = the_node_to_delete.left.nil? ? the_node_to_delete.right : the_node_to_delete.left

    # target has two children and the replacement node is a direct child of target (no sibling)
    # can shift the left subtree up to replace without dismantelling any of the replacement's children
    elsif the_node_to_delete.left.right.nil?
      replacement_node = the_node_to_delete.left

      #detach and reattach the right subtree
      right_child = the_node_to_delete.right
      right_child.parent = replacement_node
      replacement_node.right = right_child


    # target has two children and the replacement node is NOT a direct child of the_node_to_delete
    #  replace with max of left subtree (replacement )
    else
      replacement_node = the_node_to_delete.left #6
      until replacement_node.right.nil?
        replacement_node = replacement_node.right
      end

      # if replacement node has a child, disconnect and reconnect to replacement's parent on right side
      replacements_left_child = replacement_node.left
      if replacements_left_child #...is not nil
        replacement_node.parent.right = replacements_left_child
        replacements_left_child.parent = replacement_node.parent
      end

      #detach and reassign the left subtree
      left_child = the_node_to_delete.left
      left_child.parent = replacement_node
      replacement_node.left = left_child

      #detach and reattach the right subtree
      right_child = the_node_to_delete.right
      right_child.parent = replacement_node
      replacement_node.right = right_child
    end

    case what_we_are_deleting
    when "root"
      @root = replacement_node
      replacement_node.parent = nil
    when "left"
      the_parent.left = replacement_node
      replacement_node.parent = the_parent
    when "right"
      the_parent.right = replacement_node
      replacement_node.parent = the_parent
    end

    the_node_to_delete.left = nil
    the_node_to_delete.right = nil
    the_node_to_delete.parent = nil
    the_node_to_delete
  end #delete


  private

  def is_balanced?
    return true if @root.nil?

    left_depth = depth(@root.left)
    right_depth = depth(@root.right)
    delta = (left_depth - right_depth).abs

    delta <= 1 #implicit return
  end

  def depth(node=@root) #counting levels using bfs
    depth = 0
    return depth if node.nil?

    queue = [node]

    while !queue.empty?
      depth += 1
      nodes_at_this_level = queue.length

      #remove all nodes and current level and add all nodes at next level
      nodes_at_this_level.times do
        current = queue.shift
        queue << current.left if !current.left.nil?
        queue << current.right if !current.right.nil?
      end

    end

    depth
  end

end #of BalancedBST
