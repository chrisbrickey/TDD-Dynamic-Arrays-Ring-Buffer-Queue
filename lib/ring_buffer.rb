require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
  end

  # O(1)
  def [](index)
  end

  # O(1)
  def []=(index, val)
  end

  # O(1)
  def pop
  end

  # O(1) ammortized
  def push(val)
  end

  # O(1)
  def shift
  end

  # O(1) ammortized
  def unshift(val)
  end

  protected

  def check_index(index)
  end

  def resize!
  end
end
