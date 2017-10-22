require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(0)
    @length = 0
  end

  def [](index)
    @store[index]
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

  # O(1)
  # def [](index)
  #   raise "index out of bounds"
  # end
  #
  # # O(1)
  # def []=(index, value)
  # end
  #
  # # O(1)
  # def pop
  # end
  #
  # # O(1) ammortized; O(n) worst case. Variable because of the possible
  # # resize.
  # def push(val)
  # end
  #
  # # O(n): has to shift over all the elements.
  # def shift
  # end
  #
  # # O(n): has to shift over all the elements.
  # def unshift(val)
  # end
  #
  # protected
  #
  #
  # def check_index(index)
  # end
  #
  # # O(n): has to copy over all the elements to the new store.
  # def resize!
  # end
end
