require_relative "minmaxstack"

class MinMaxStackQueue

  def initialize
    @store = MinMaxStack.new
  end

  def enqueue(el)
    @store.enqueue(el)
  end

  def dequeue
    @store.dequeue
  end

  def min
    @store.min
  end

  def max
    @store.max
  end

end
