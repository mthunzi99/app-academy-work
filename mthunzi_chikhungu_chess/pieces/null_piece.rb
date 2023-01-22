require_relative 'piece'
require 'singleton'

class NullPiece < Piece
    include Singleton

    attr_reader :symbol
    def initialize
        @symbol = " "
        @colour = :none
    end

    def empty?
        true
    end

    def moves
        []
    end

end