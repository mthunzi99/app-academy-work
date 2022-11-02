require_relative '00_tree_node.rb'
require 'byebug'

class KnightPathFinder
    attr_reader :start_pos

    DELTAS = [
        [-1, 2],
        [1, 2],
        [2, 1],
        [2, -1],
        [1, -2],
        [-1, -2],
        [-2, -1],
        [-2, 1]
    ]

    
    def valid_moves(pos) # Returns an array of the valid positions that the night can move to from pos
        x, y = pos # Splits the 2 values from the pos array into their own variables called x and y
        valid = []

        DELTAS.each do |i, j|
            new_pos = [x + i, y + j]
            valid << new_pos if new_pos.all? { |coord| coord.between?(0, 7) }
        end
        
        valid # Array of valid moves
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]

        p new_move_positions(start_pos)
    end

    private_constant :DELTAS

    private

    attr_accessor :root_node, :considered_positions

    def new_move_positions(pos) # Returns array of valid move positions that havene't been considered
        new_positions = valid_moves(pos).reject { |new_pos| @considered_positions.include?(new_pos) }
        @considered_positions.concat(new_positions)

        new_positions
    end

    def build_move_tree # Creates the Polytree with all the possible moves
        self.root_node = PolyTreeNode.new(@start_pos) #creates a new instance variable for the root_node as an instance of the Polytree node class

        nodes = [root_node] 
        until nodes.empty?
            current_node = nodes.shift
            current_pos = current_node.value

            # Loops through the new_move_positions array to add child nodes in a dfs manner
            new_move_positions(current_pos).each do |pos|
                new_node = PolyTreeNode.new(pos)
                current_node.add_child(new_node) 

                nodes << new_node
            end
        end
    end

end


if $PROGRAM_NAME == __FILE__
    kpf = KnightPathFinder.new([2, 2])
    print kpf.new_move_positions([4,3])
    print kpf.considered_positions
end