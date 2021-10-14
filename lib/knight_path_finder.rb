require_relative "polytree_node"
require "byebug"

class KnightPathFinder
    attr_reader :considered_postions
    def initialize(starting_point)
        @considered_postions = [starting_point]
        @starting_point = starting_point
        build_move_tree
    end

    def self.valid_moves(pos)
        all_moves = [
            [pos[0]+1, pos[1]+2],
            [pos[0]-1, pos[1]+2],
            [pos[0]+1, pos[1]-2],
            [pos[0]-1, pos[1]-2],
            [pos[0]+2, pos[1]+1],
            [pos[0]-2, pos[1]+1],
            [pos[0]+2, pos[1]-1],
            [pos[0]-2, pos[1]-1],
        ]
        all_moves.select! {|move| (0..7).include?(move[0]) && (0..7).include?(move[1]) }
    end

    def build_move_tree
        @root_node = PolyTreeNode.new(@starting_point)
        queue = [@root_node]
        until queue.empty?
            el = queue.shift
            new_children = new_move_positions(el.value)
            if new_children
                new_children.each do |child| 
                    child_node = PolyTreeNode.new(child)
                    el.add_child(child_node)
                    queue << child_node
                end
            end
        end
    end

    def new_move_positions(pos)
        all_positions = KnightPathFinder.valid_moves(pos)
        if all_positions && @considered_postions
            new_positions = all_positions - @considered_postions
            @considered_postions.concat(new_positions)
            return new_positions
        else 
            nil
        end
    end

    def find_path(end_pos)
        end_node = @root_node.bfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        path = [end_node.value]
        node = end_node
        until node == @root_node 
            path.unshift(node.parent.value)
            node = node.parent
        end
        path
    end
end