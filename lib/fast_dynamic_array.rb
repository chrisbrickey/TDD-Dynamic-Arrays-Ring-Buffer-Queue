require_relative "static_array"

class FastDynamicArray
  attr_reader :length, :store


  def initialize
    @store = StaticArray.new(1)
    @length = 0
    @capacity = 1
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
    if @capacity > @length
      @store[@length] = item
    else
      old_store = @store
      old_length = @length

      @capacity *= 2
      @store = StaticArray.new(@capacity)

      (0...old_length).each do |idx|
        @store[idx] = old_store[idx]
      end

      @store[old_length] = item

    end

    @length += 1
    @store
  end


  def pop
    return nil if @length < 1

    @length -= 1
    @store[@length]
  end


  def shift
    return nil if @length < 1

    item_to_be_removed = @store[0]

    old_store = @store
    old_length = @length

    @length -= 1
    @store = StaticArray.new(@length)

    #omits the 0th element of the old store
    (1...old_length).each do |idx|
      @store[idx - 1] = old_store[idx]
    end

    item_to_be_removed
  end


  def unshift(item)
    old_store = @store
    old_length = @length


    if @capacity <= @length
      @capacity *= 2
      @store = StaticArray.new(@capacity)
    end

    @store[0] = item
    (0...old_length).each do |idx|
      @store[idx + 1] = old_store[idx]
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

  end


end # of the class
