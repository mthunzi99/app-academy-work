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

    def move_piece(colour, start_pos, end_pos)
        raise ArgumentError.new "There is no piece at #{start_pos}" if self[start_pos].is_a?(NullPiece)
        raise ArgumentError.new "You cannot move to #{end_pos}" if self[end_pos].is_a?(Piece)
        raise ArgumentError.new "It's not #{colour}'s turn" if self[start_pos].colour == colour
        
        
        self[end_pos] = self[start_pos] 
        self[start_pos] = NullPiece.new

        nil
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end


    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def dup
        @rows.dup
    end

end