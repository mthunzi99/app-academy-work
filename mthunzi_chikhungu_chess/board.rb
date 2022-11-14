require_relative 'piece'
require_relative 'null_piece'

class Board
    def populate_board
        piece_rows = [0,1,6,7]

        (0...8).each do |row|
            (0...8).each do |col|
                if piece_rows.include?(row)
                    @rows[row][col] = Piece.new 
                else
                    @rows[row][col] = NullPiece.new
                end
            end
        end
    end
    attr_accessor :rows
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        @null_piece = NullPiece.new

        # populate_board
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end



end