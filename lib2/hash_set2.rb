class HashSet2

  def initialize
    @elements = []
    @size = 0
  end

  def size
    @size
  end

  def add(element)

    @elements.each do |el|
      if el == element
        return nil
      end
    end

    @elements << element
    @size += 1
  end

  def addAll(arr)
    arr.each do |el|
      add(el)
    end
  end

  def contain(element)
    @elements.each do |el|
      if el == element
        return true
      end
    end

    false
  end

  def remove(element)
    new_elements = []
    @elements.each do |el|
      if el != element
        new_elements << el
      else
        @size -= 1
      end
    end

    @elements = new_elements
  end

  def removeAll(arr)
    arr.each do |el|
      remove(el)
    end
  end

  def equals(set)
    @elements.each do |el|
      if !set.contain(el)
        return false
      end
    end

    set.size == @size
  end

  def clear
    @elements = []
    @size = 0
  end

  def isEmpty
    @size == 0
  end

end