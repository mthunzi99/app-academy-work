class Piece
    attr_reader :color, :board
    attr_accessor :pos

    def initialize(color, board, pos)
        @color, @board, @pos = color, board, pos

        @board.add_piece(self, pos)
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

    def valid_moves
        moves.reject { |end_pos| move_into_check?(end_pos) }
    end

    def move_into_check?(end_pos)
        test_board = @board.dup
        test_board.move_piece(@pos, end_pos)
    end
end

if $PROGRAM_NAME == __FILE__

end