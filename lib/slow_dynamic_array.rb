# this SlowDynamicArray is used to provide a baseline for testing efficiency of FastDynamicArray
require_relative "static_array"

class SlowDynamicArray
  attr_reader :length, :store


  def initialize
    @store = StaticArray.new(0)
    @length = 0
  end


  def [](index)
    check_bounds(index)
    @store[index]
  end


  def []=(index, value)
    check_bounds(index)
    @store[index] = value
    @store[index]
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
    @length -= 1

    #omits the 0th element of the old store
    (1..@length).each do |idx|
      @store[idx - 1] = old_store[idx]
    end

    old_store[0] #element to be removed
  end


  def unshift(item)
    old_store = @store
    old_length = @length

    @length += 1
    @store = StaticArray.new(@length)

    @store[0] = item
    (0...old_length).each do |idx|
      @store[idx + 1] = old_store[idx]
    end

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


end # of the class
