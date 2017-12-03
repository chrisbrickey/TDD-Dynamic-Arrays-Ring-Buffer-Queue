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

  def contain(element)
    @elements.each do |el|
      if el == element
        return true
      end
    end

    false
  end



end