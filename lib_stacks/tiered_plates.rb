class TieredPlates

  def initialize
    @stacks = [[nil, nil, nil]]
    @capacity = 3
    @num_of_stacks = 1
    @length = 0
  end

  def push(element)
    stack_idx = @num_of_stacks - 1  #0 if still on first stack
    col_idx = @length % 3
    @stacks[stack_idx][col_idx] = element
  end

  def pop()
    "a"
  end


  def atIndex(idx)
  end

end # of class
