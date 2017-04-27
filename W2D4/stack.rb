class Stack

  def initialize(store = [])
    @store = store
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
  end

  def peek
    @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end
