require_relative "hashing.rb"
require 'byebug'

class HashSetFast
  attr_reader :size


  def initialize
    @store = Array.new(4) {Array.new}
    @size = 4
    @count_of_items = 0
  end


  def insert(element)
    # debugger
    resize if @count_of_items == @size
    @count_of_items += 1
    position = element.my_hash % @size
    @store[position] << element
  end


  def remove(element)
    # debugger
    position = element.my_hash % @size
    new_subarray = []
    found = false
    count = 0

    @store[position].each do |el|
      if (el != element) || count > 0
        new_subarray << el
      else
        found = true
        count += 1
      end
    end

    raise "element does not exist" if found == false
    @count_of_items -= 1
    @store[position] = new_subarray
  end


  def include?(element)
    @store.each do |subarray|
      subarray.each do |el|
        return true if el == element
      end
    end

    false
  end

  private

  def resize
    old_store = @store
    new_store = Array.new(@size * 2) {Array.new}
    old_store.each do |subarray|
      subarray.each do |el|
        position = el.my_hash % @size
        new_store[position] << el
      end
    end

    @size *= 2
    @store = new_store
  end

end
