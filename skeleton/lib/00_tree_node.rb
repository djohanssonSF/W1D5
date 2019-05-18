require "byebug"

class PolyTreeNode

    attr_accessor :children, :parent, :value

  def inspect
    "value:#{@value} parent:#{@parent} children:#{@children}"
  end

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if self.parent
      self.parent.children.delete(self)
    end
      
    @parent = node
    unless parent.nil?
      @parent.children << self unless @parent.children.include?(self)
    end

  end

  def add_child(child_node)
    if !children.include?(child_node)
      @children << child_node
      child_node.parent = self
    end
  end

  def remove_child(child_node)
    
    
    if children.include?(child_node)
      @children.delete(child_node)
      child_node.parent = nil
    else
      raise "Child does not exist!"
    end
  end

end