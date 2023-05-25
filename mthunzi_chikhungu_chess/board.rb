require_relative 'pieces'
require_relative 'display'
require 'byebug'
class Board
    attr_accessor :rows
    def initialize(populate = true)
        @null_piece = NullPiece.instance

        create_board(populate)
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def add_piece(piece, pos)
        raise "This position is not empty" unless empty?(pos)

        self[pos] = piece
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        raise ArgumentError.new "Piece cannot move to #{end_pos}" unless piece.moves.include?(end_pos)
        
        self[end_pos] = piece 
        self[start_pos] = @null_piece
        piece.pos = end_pos
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end

    def in_check?(color)
        king_pos = find_king(color)
        pieces.any? { |piece| piece.color != color && piece.moves.include?(king_pos) }
    end

    def checkmate?(color)
        return false unless in_check?(color)
        
        opponent = pieces.select { |piece| piece.color != color }
        opponent.all? { |piece| piece.valid_moves.empty? }
    end

    def dup
        @rows.dup
    end

    def empty?(pos)
        self[pos].empty?
    end

    private

    attr_reader :null_piece

    def create_board(populate)
        @rows = Array.new(8) { Array.new(8, @null_piece) }
        return unless populate

        [:black, :white].each do |color|
            populate_back_row(color)
            populate_pawn_row(color)
        end
    end

    def populate_back_row(color)
        row = color == :white ? 7 : 0
        back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        
        back_row.each_with_index do |piece, col|
            piece.new(color, self, [row,col])
        end
    end

    def populate_pawn_row(color)
        row = color == :white ? 6 : 1

        8.times do |col|
            Pawn.new(color, self, [row,col])
        end
    end

    def find_king(color)
        king = pieces.find { |piece| piece.color == color && piece.is_a?(King) }
        king.pos
    end
end

if $PROGRAM_NAME == __FILE__
    
end