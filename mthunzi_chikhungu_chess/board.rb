require_relative 'pieces'
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

    def add_piece(piece, pos)
        raise "This position is not empty" unless empty?(pos)

        self[pos] = piece
    end

    def move_piece(colour, start_pos, end_pos)
        raise ArgumentError.new "There is no piece at #{start_pos}" if self[start_pos].is_a?(NullPiece)
        raise ArgumentError.new "You cannot move to #{end_pos}" if self[end_pos].is_a?(Piece)
        raise ArgumentError.new "It's not #{colour}'s turn" if self[start_pos].colour == colour
        
        self[end_pos] = self[start_pos] 
        self[start_pos] = NullPiece.new
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

    def empty?(pos)
        self[pos].empty?
    end

    private

    attr_reader :null_piece

    def create_board(populate)
        @rows = Array.new(8) { Array.new(8, @null_piece) }
        return unless populate

        [:balck, :white].each do |colour|
            populate_back_row(colour)
            populate_pawn_row(colour)
        end
    end

    def populate_back_row(colour)
        row = colour == :white ? 7 : 0
        back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        
        back_row.each_with_index do |piece, col|
            piece.new(colour, self, [row,col])
        end
    end

    def populate_pawn_row(colour)
        row = colour == :white ? 6 : 1

        8.times do |col|
            Pawn.new(colour, self, [row,col])
        end
    end

end

a = Board.new
p a


