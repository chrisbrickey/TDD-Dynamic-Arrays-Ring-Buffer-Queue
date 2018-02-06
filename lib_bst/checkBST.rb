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
  false
end
