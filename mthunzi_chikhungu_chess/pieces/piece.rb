class Piece
    attr_reader :colour, :board
    attr_accessor :pos

    def initialize(colour, board, pos)
        @colour, @board, @pos = colour, board, pos

        board.add_piece(self)
    end

    def to_s
        " #{symbol} "
    end

    def empty?
        false
    end

    def valid_moves
        moves.reject! { |move| move_into_check?(move) }
    end

    private

    def move_into_check?(end_pos)
        dup_board = board.dup
        dup_board.move_piece(@pos, end_pos)
        
    end

end