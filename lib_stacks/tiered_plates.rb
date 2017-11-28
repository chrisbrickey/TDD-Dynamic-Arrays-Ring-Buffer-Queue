class TieredPlates

  attr_reader :stacks

  def initialize
    @stacks = [[nil, nil, nil]]
    @capacity = 3
    @num_of_stacks = 1
    @length = 0
  end

  def push(element)
    grow if @capacity == @length

    stack_idx = @num_of_stacks - 1  #0 if still on first stack
    col_idx = @length % 3
    @stacks[stack_idx][col_idx] = element
    @length += 1
  end

  def pop()
    element = @stacks[@num_of_stacks - 1][(@length - 1) % 3]
    @stacks[@num_of_stacks - 1][(@length - 1) % 3] = nil
    @length -= 1

    shrink if @length % 3 == 0
    element
  end


  def atIndex(idx)
  end

  private

  def grow
    @stacks << [nil, nil, nil]
    @capacity += 3
    @num_of_stacks += 1
  end

  def shrink
    @stacks.pop
    @capacity -= 3
    @num_of_stacks -= 1
  end

end # of class
