require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  include Enumerable

  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
  end

  def set(key, val)
    @store.each_with_index do |linked_list, idx|
      if (key.hash % @store.length) == idx
        if linked_list.include?(key)
          linked_list.update(key, val)
        else
          linked_list.append(key, val)
        end
      end
    end
  end

  def get(key)
    hashed_key = key.hash % @store.length
    @store[hashed_key].get(key)
  end

  def delete(key)
  end

  def each(&prc)
    i = 0
    while i < @store.length
      @store[i].each(&prc)
      i += 1
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set



  # def [](key)
    # key = key.hash % @store.length
    # @store[key].get(key)
  # end
  #
  # def []=(key, value)
  #   key = key.hash % @store.length
  #   @store[key].append(key, value)
  # end

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
