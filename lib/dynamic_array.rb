require_relative "static_array"

class DynamicArray
  attr_reader :length, :store


  def initialize
    @store = StaticArray.new(0)
    @length = 0
  end


  def [](index)
    if in_bounds?(index)
      @store[index]
    else
      raise "index out of bounds"
    end
  end


  def []=(index, value)
    if in_bounds?(index)
      @store[index] = value
      @store[index]
    else
      raise "index out of bounds"
    end
  end


  def push(item)
    old_store = @store
    old_length = @length

    @length += 1
    @store = StaticArray.new(@length)

    (0...old_length).each do |idx|
      @store[idx] = old_store[idx]
    end

    @store[old_length] = item
    @store
  end


  def pop
    return nil if @length < 1

    @length -= 1
    return @store[@length]
  end


  def shift
    return nil if @length < 1

    old_store = @store
    old_length = @length
    @length -= 1
    new_store = StaticArray.new(@length)

    #omits the 0th element of the old store
    (1...old_length).each do |idx|
      new_store[idx - 1] = old_store[idx]
    end

    @store = new_store

    old_store[0]
  end

  private

  def in_bounds?(index)
    if (index >= 0) && (index < @length)
      true
    elsif (index < 0) && (index.abs <= @length)
      true
    else
      false
    end
  end

end # of the class
