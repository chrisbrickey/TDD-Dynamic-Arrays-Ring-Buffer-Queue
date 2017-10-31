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




end
