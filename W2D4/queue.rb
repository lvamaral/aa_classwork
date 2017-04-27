class Queue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end
