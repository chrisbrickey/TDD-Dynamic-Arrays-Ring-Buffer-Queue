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


class Array

  def my_hash
    salt = 242
    "a"
  end

end

class Hash

  def my_hash
    salt = 384
    "a"
  end

end

class String

  def my_hash
    salt = 702
    "a"
  end

end
