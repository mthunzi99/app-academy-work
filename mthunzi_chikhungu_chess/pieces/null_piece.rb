require_relative 'piece'
require 'singleton'

class NullPiece
    include Singleton

    def initialize

    end

    def empty?
        true
    end

    def moves

    end

    def symbol

    end
    
end