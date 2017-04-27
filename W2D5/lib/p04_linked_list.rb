class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.next.prev = self.prev
    self.prev.next = self.next
  end
end

class LinkedList
  def initialize
    @first = Link.new
    @last = Link.new
    @store = {}
    @first.next = @last
    @last.prev = @first
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if empty?
      @first
    else
      @first.next
    end
  end

  def last
    if empty?
      @last
    else
      @last.prev
    end
  end

  def empty?
    @store.empty?
  end

  def get(key)
    @store[key].nil? ? nil : @store[key].val
  end

  def include?(key)
    @store.has_key?(key)
  end

  def append(key, val)
    addition = Link.new(key, val)
    @last.prev.next = addition
    @last.prev = addition
    addition.next = @last
    @store[key] = addition
  end

  def update(key, val)
    @store[key].val = val if @store[key]
  end

  def remove(key)
    current_link = @store[key]
    @store.delete(key)
    current_link.prev = current_link.next
    current_link.next = current_link.prev
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
