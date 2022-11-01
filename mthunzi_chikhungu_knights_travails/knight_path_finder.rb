require_relative '00_tree_node.rb'

class KnightPathFinder
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
    
    def initialize(root_node)
        @root_node = root_node
        @considered_positions = [@root_node]

        
    end

    def valid_moves(pos) # Returns an array of the valid positions that the night can move to from pos
        x, y = pos # Splits the 2 values from the pos array into their own variables called x and y
        valid = []

        DELTAS.each do |node|
            i, j = node # Splits the 2 values from the node array into their own variables called i and j

            next if i+x >= 8 || i+x < 0 # Skips if the x value is outside the chess board
            next if j+y >= 8 || j+y < 0 # Skips if the y value is outside the chess board

            valid << [i+x, j+y]
        end
        
        valid # Array of valid moves
    end

    def new_move_positions(pos) # Returns array of valid move positions that havene't been considered
        positions = []
        valid_moves(pos).each { |node| positions << node unless @considered_positions.include?(node) } # Adds the new move positions to the postions array
        @considered_positions.concat(positions) # Adds the new move positions to the @considered_positions array
        
        positions # Array of new move positions
    end

    def build_move_tree # Creates the Polytree that with all the possible moves
        tree = [@root_node]



    end


end