require_relative "hashing.rb"

class HashSetFast
  attr_reader :size, :store


  def initialize
    @store = Array.new(4) {Array.new}
    @size = 4
  end


  def insert(element)
    position = element.my_hash % @size
    @store[position] << element
  end


  def remove(element)
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

end
