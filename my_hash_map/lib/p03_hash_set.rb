class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      if count >= @store.length
        resize!
      end
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    @store.each { |arr| return true if arr.include?(key) }
    false
  end

  def remove(key)
    @store.each do |arr|
      if arr.include?(key)
        arr.delete(key)
        @count -= 1
      end
    end
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `key`
    key = key.hash % @store.length
    @store[key]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    flattened = @store.flatten
    new_length = @store.length * 2
    @store = Array.new(new_length) { Array.new }
    flattened.each do |key|
      insert(key)
    end
  end
end
