def checkBST(node)
  return false if node.nil?

  if !node.left.nil? && node.left.value > node.value
    return false
  end

  if !node.right.nil? && node.right.value < node.value
    return false
  end

  if checkBST(node.left) && checkBST(node.right)
    return true
  end

end


# Use recursion. Pass down two parameters:
#   1)  lessThan (which means that all nodes in the current subtree must be smaller than this value)
#   2)  largerThan (all must be larger than it).

# Compare root of the current subtree with these two values.
# Then, recursively check the left and right subtree of the current one.
# Take care of the values passed down.

#     def isValidBST(self, root, lessThan = float('inf'), largerThan = float('-inf')):
#         if not root:
#             return True
#         if root.val <= largerThan or root.val >= lessThan:
#             return False
#         return self.isValidBST(root.left, min(lessThan, root.val), largerThan) and \\
#                self.isValidBST(root.right, lessThan, max(root.val, largerThan))


def check_subtree(small, large)
  start_node = bsearch(large.root, small.root.value)
  return false if start_node.nil?
  traverse_in_order(small.root) == traverse_in_order(start_node)
end

def traverse_in_order(tree_node, sorted_arr=[])
  if tree_node.left
    traverse_in_order(tree_node.left, sorted_arr)
  end

  sorted_arr << tree_node.value

  if tree_node.right
    traverse_in_order(tree_node.right, sorted_arr)
  end

  sorted_arr
end

def bsearch(tree_node, target)
  return nil if tree_node.nil?

  if tree_node.value == target
    return tree_node
  elsif target < tree_node.value
    return bsearch(tree_node.left, target)
  else
    return bsearch(tree_node.right, target)
  end
end
