module Searchable
    def dfs(target_value)
        return self if self.value == target_value # Returns the node that has the target_value

        children.each do |child| 
            result = child.dfs(target_value) # Stores the result of the recursive call
            return result unless result.nil? # Returns the result unless it is nil
        end

        nil # Returns nil if target_value can't be found in the polytree
    end

    def bfs(target_value)
        queue = [self] # Queue for nodes
        while !queue.empty? # Loops until queue is empty
            node = queue.shift # Takes node from the front of the queue and stores it in the node var
            
            return node if node.value == target_value # Returns the node that has the target_value
            queue.concat(node.children) # Adds children to the end of the queue 
        end

        nil # Returns nil if target_value can't be found in polytree
    end

end

class PolyTreeNode
    include Searchable

    attr_reader :parent
    attr_accessor :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent)
        return if @parent == parent

        @parent._children.delete(self) if @parent

        @parent = parent
        @parent._children << self unless @parent.nil?

        self
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise "Node is not a valid child" if !@children.include?(child)
        child.parent = nil
    end

    protected
    def _children
        @children
    end

end