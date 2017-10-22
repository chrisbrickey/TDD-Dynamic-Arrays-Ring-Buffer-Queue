require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(0)
    @length = 0
  end

  def [](index)
    if index < @length
      result = @store[index]
      if result == nil
        raise "index out of bounds"
      else
        return result
      end
    else
      raise "index out of bounds"
    end
  end

  def []=(index, value)
    if (index < 0) && (index.abs <= @length)
      @store[index] = value
      result = @store[index]
      return result
    elsif (index < 0) # neg and out of bounds
      raise "index out of bounds"
    elsif (index < @length) #pos and in bounds
      @store[index] = value
      result = @store[index]
      return result
    else # pos and out of bounds
      raise "index out of bounds"
    end
  end

  def push(item)
    old_store = @store
    old_length = @length
    new_length = old_length + 1
    new_store = StaticArray.new(new_length)
    @length = new_length

    (0...old_length).each do |idx|
      new_store[idx] = old_store[idx]
    end

    new_store[old_length] = item
    @store = new_store
  end

  def pop
    @length -= 1
    @store[@length]
  end

  def shift
    @length -= 1
  end

end
