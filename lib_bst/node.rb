class Node

  attr_reader :value
  attr_accessor :parent, :left, :right

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
    @parent = nil
  end

end
