class Node

  attr_accessor :value, :left, :right

  def initialize(val=nil)
    @value = val
    @left = nil
    @right = nil
    # may need @parent = nil if need to traverse up the tree
  end

end
