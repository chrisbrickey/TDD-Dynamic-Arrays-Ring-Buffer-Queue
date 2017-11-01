require_relative "hashing.rb"

class HashSet
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

    @store[position].each do |el|
      if el != element
        new_subarray << el
      else
        found = true
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
