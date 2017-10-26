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
    resize if @capacity <= @length

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

    if @capacity <= @length
      old_store = @store
      resize
      @store[0] = item
      (1..@length).each do |idx|
        @store[idx] = old_store[idx - 1]
      end
      @start_idx = 0
    else
      @start_idx = (@start_idx - 1) % @capacity
      @store[@start_idx] = item
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
    new_store = StaticArray.new(@capacity)
    @length.times { |idx| new_store[idx] = @store[idx] }
    @store = new_store
  end

end
