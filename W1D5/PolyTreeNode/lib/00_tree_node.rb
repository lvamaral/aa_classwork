class PolyTreeNode

  attr_accesor :value, :parent, :children

  def initialize(val = nil, parent = nil)
    @value, @parent, @children = val, parent, []
  end

  def parent
    @parent.dup
  end

  def children
    @children.dup
  end

  def value
    @value
  end




end
