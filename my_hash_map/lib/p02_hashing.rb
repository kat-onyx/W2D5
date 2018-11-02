class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    new_hash_var = ""
    each do |ele|
      if ele.is_a?(Array)
        new_hash_var += ele.hash
      elsif ele.is_a?(String)
        new_hash_var += str_to_hash(ele)
      else
        new_hash_var += ele.to_s
      end
    end
    new_hash_var.to_i
  end

  def str_to_hash(str)
    new_str = ""
    str.chars.each do |char|
      new_str += char.ord
    end
    return new_str
  end
end

class String
  def hash
    new_str = ""
    self.chars.each do |char|
      new_str += char.ord.to_s
    end
    return new_str.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_str = ""
    # self.each do |k, v|
    #   new_str += v.ord.to_s
    # end
    # new_str.to_i
    hash_arr = self.sort_by { |k, v| k }
    hash_arr.each do |subarr|
      new_str << subarr[1].ord.to_s
    end
    new_str.to_i
  end
end
