class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent_node)
        if !@parent.nil?
            @parent.children.delete(self)
        end
        @parent = parent_node
        if !@parent.nil? 
            @parent.children << self
        end
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        if child_node.parent == nil
            raise "Node has no parent"
        else
            child_node.parent=(nil)
            @children.delete(child_node)
        end
    end

    def dfs(target_value)
        return self if @value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if !result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            el = queue.shift
            return el if el.value == target_value
            el.children.each { |child| queue << child }
        end
    end

end