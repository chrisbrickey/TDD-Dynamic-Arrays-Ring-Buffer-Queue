require_relative "hashing.rb"

class HashSet
  attr_reader :size

  def initialize
    @size = 4
  end
end
