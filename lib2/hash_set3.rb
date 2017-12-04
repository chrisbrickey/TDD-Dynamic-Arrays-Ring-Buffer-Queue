class Set

  def initialize
    @elements = []
  end

  def isEmpty
    @elements.length == 0
  end

  def add(element)
    @elements << element
  end

  def remove(element)
    new_elements = []
    @elements.each do |el|
      if el != element
        new_elements << el
      end
    end

    @elements = new_elements
  end


end