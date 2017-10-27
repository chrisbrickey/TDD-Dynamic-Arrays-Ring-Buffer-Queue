class Integer

  def my_hash
    salt = 937

    result = 1
    str = self.to_s
    str.each_char.with_index do |char, idx|
      result *= (salt * (char.ord + idx))
    end

    result
  end

end

class String

  def my_hash
    salt = 702
    result = 1
    self.each_char.with_index do |char, idx|
      result *= (salt * (char.ord + idx))
    end

    result
  end

end


class Array

  def my_hash
    salt = 242
    result = 1
    self.each do |el|
      el_str = el.to_s
      el_str.each_char.with_index do |char, idx|
        result *= (salt * (char.ord + idx))
      end
    end

    result
  end

end

class Hash

  def my_hash
    salt = 384
    result = 1
    self.each do |key|
      key_str = key.to_s
      key_str.each_char.with_index do |char, idx|
        result *= (salt * (char.ord + idx))
      end
    end

    result
  end

end
