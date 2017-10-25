require_relative "static_array"

class RingBuffer

  attr_reader :length

  def initialize
    @store = StaticArray.new(1)
    @capacity = 1
    @length = 0
    @start_idx = 0
  end

  def[](idx)
    check_bounds(idx)
    @store[(@start_idx + idx) % @capacity]
  end

  def[]=(idx, value)
    check_bounds(idx)
    @store[(@start_idx + idx) % @capacity] = value
    @store[(@start_idx + idx) % @capacity]
  end

  def push(item)
    if @capacity <= @length
      old_store = @store
      resize

      (0...@length).each do |idx|
        @store[(@start_idx + idx) % @capacity] = old_store[(@start_idx + idx) % @capacity]
      end
    end

    @store[(@start_idx + @length) % @capacity] = item
    @length += 1
    @store
  end

  def pop
    return nil if @length < 1

    @length -= 1
    @store[(@start_idx + @length) % @capacity]
  end

  def shift
    return nil if @length < 1
    element_to_be_removed = @store[@start_idx]

    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    element_to_be_removed
  end

  def unshift(item)
    old_store = @store
    resize if @capacity <= @length

    @store[@start_idx + 0] = item
    (0...@length).each do |idx|
      @store[((@start_idx + idx) % @capacity) + 1] = old_store[(@start_idx + idx) % @capacity]
    end

    @length += 1
    @store
  end

  private


  def check_bounds(index)
    if (index >= 0) && (index < @length)
      true
    elsif (index < 0) && (index.abs <= @length)
      true
    else
      raise "index out of bounds"
    end
  end

  def resize
    @capacity *= 2
    @store = StaticArray.new(@capacity)
  end

end
