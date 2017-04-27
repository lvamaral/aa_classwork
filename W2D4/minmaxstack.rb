require_relative "stackqueue"

class MinMaxStack

  attr_accessor :min, :max

  def initialize
    @store = Stack.new
    @max = nil
    @min = nil
  end

  def update_min(el)
    @min = el if min.nil?
    @min = el if el < @min
  end

  def update_max(el)
    @max = el if @max.nil?
    @max = el if el > max
  end

  def dequeue
    @store.dequeue
  end

  def enqueue(el)
    @store.enqueue(el)
    update_max(el)
    update_min(el)
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end
