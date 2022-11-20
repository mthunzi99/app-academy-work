class Piece
    attr_reader :colour, :board
    attr_accessor :pos

    def initialize(colour, board, pos)
        @colour, @board, @pos = colour, board, pos

        board.add_piece(self)
    end

    def symbol
        # Implemented by subclass
        raise NotImplementedError
    end
    
    def to_s
        " #{symbol} "
    end

    def empty?
        false
    end


end