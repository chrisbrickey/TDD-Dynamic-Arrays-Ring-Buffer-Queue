class Set

  def initialize
    @elements = Array.new(2)
    @length = 0
    @capacity = 1
  end

  def size
    @length
  end

  def isEmpty
    @length == 0
  end

  def add(element)
    @elements.each do |el|
      if el == element
        return
      end
    end

    resize if @length == @capacity
    @elements[@length] = element
    @length += 1
  end

  def remove(element)
    new_elements = Array.new(@capacity)
    idx = 0
    @elements.each do |el|
      if el != element
        new_elements[idx] = el
        idx += 1
      else
        @length -= 1
      end
    end

    @elements = new_elements
  end

  def resize
    @capacity *= 2
    new_elements = Array.new(@capacity)
    @elements.each_with_index do |el, idx| 
      new_elements[idx] = el
    end
    
    @elements = new_elements
  end

end