require_relative 'pieces'
require_relative 'null_piece'

class Board
    def populate_board
        piece_rows = [0,1,6,7]

        (0...8).each do |row|
            (0...8).each do |col|
                if piece_rows.include?(row)
                    @rows[row][col] = Piece.new(self)
                else
                    @rows[row][col] = NullPiece.new
                end
            end
        end

        nil
    end

    attr_accessor :rows
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @null_piece = NullPiece.new

        populate_board
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def add_piece(piece, pos)
        raise "This position is not empty" unless self[pos].empty?

        self[pos] = piece
    end

    def move_piece(start_pos, end_pos)
        raise ArgumentError.new "There is no piece at #{start_pos}" if self[start_pos].is_a?(NullPiece)
        raise ArgumentError.new "You cannot move to #{end_pos}" if self[end_pos].is_a?(Piece)

        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.new

        nil
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end

    def checkmate?(colour)
        return false unless in_check?(colour)

        checking = pieces.select { |piece| piece.colour == colour}
        checking.each do |p|
            p.valid_moves.empty?
        end
    end

    def in_check?(colour)
        king_pos = find_king(colour).pos
        pieces.any? do |piece|
            piece.colour != colour && piece.moves.include?(king_pos)
        end
    end

    def find_king(colour)
        pieces.find { |piece| piece.color == color && piece.is_a?(King) }
    end

    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def dup
        @rows.dup
    end

end