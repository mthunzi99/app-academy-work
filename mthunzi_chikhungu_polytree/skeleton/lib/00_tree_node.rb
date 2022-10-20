class PolyTreeNode
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