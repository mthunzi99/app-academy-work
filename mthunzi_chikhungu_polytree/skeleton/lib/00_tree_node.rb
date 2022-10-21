module Searchable
    def dfs(target_value)
        return self if self.value == target_value

        children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end

        nil
    end

    def bfs(target_value)
        array = [self]
        while !array.empty?
            node = array.shift
            
            return node if node.value == target_value
            array.concat(node.children)      
        end

        nil
    end

end

class PolyTreeNode
    include Searchable

    attr_reader :parent, :children
    attr_accessor :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent)
        return if @parent == parent

        @parent.children.delete(self) if @parent

        @parent = parent
        @parent.children << self unless @parent.nil?

        self
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise "Node is not a valid child" if !@children.include?(child)
        child.parent = nil
    end

end