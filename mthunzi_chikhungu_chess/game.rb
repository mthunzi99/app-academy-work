require_relative 'board'
require_relative 'display'

class Game
    attr_reader :board, :display, :current_player

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @current_player = :white
    end

    def play
        until @board.checkmate?(@current_player)
            start_pos, end_pos = nil, nil
            until start_pos && end_pos
                @display.render  
              
                if start_pos
                    end_pos = @display.cursor.get_input
                else
                    start_pos = @display.cursor.get_input
                end
            end

            @board.move_piece(start_pos, end_pos)
        end
    end


end

if $PROGRAM_NAME == __FILE__
    Game.new.play
end