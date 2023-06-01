require 'colorize'
require_relative 'cursor'

class Display
    attr_reader :board, :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board) 
        
    end

    def build_grid
        @board.rows.map.with_index do |row, i|
            build_row(row, i)
        end
    end

    def build_row(row, i)
        row.map.with_index do |piece, j|
            color = background_clr_for(i, j)
            piece.to_s.colorize(color)
        end
    end

    def background_clr_for(i, j)
        if @cursor.cursor_pos == [i, j] && @cursor.selected
            color = :light_green
        elsif @cursor.cursor_pos == [i, j]
            color = :light_red
        elsif (i + j).odd?
            color = :light_blue
        else
            color = :light_yellow
        end

        { background: color } 
    end

    def render
        # system("cls") || system("clear")
        puts "Use WASD or IJKL to move the cursor. Use SPACE select"
        build_grid.each { |row| puts row.join }
    end
end

if $PROGRAM_NAME == __FILE__

end
