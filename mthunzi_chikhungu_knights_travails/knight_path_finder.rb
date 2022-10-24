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
        
        valid # List of valid moves
    end


end