require_relative "stack"
require_relative "queue"

class StackQueue

  attr_accessor :store, :store2

  def initialize
    @in_stack = Stack.new
    @out_stack = Stack.new
  end

  def dequeue
    if @out_stack.empty?
      @out_stack << @in_stack.pop until @in_stack.empty?
    end
    @out_stack.pop
  end

  def enqueue(el)
    @in_stack << el
  end

  def size
    @in_stack.count + @out_stack.count
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

end
