require_relative 'piece'

class Pawn < Piece

    def symbol
        '♟'.colorize(colour)
    end

    def moves
        forward_steps + side_attacks
    end

    # private

    def at_start_row?
        x, y = @pos
        return true if x == 6 && @colour == :white
        return true if x == 1 && @colour == :black

        false
    end

    def forward_dir
        @colour == :white ? -1 : 1
    end

    def forward_steps
        x, y = @pos
        one_step =  [x + forward_dir, y]
        return [] unless @board.valid_pos?(one_step) && @board.empty?(one_step)

        steps = [one_step]
        two_step = [x + forward_dir * 2, y]
        steps << two_step if at_start_row? && @board.empty?(two_step)
        steps
    end

    def side_attacks
        x, y = pos
        attacks = [ [x + forward_dir, y - 1], [x + forward_dir, y + 1] ]

        attacks.select do |new_pos|
            next false unless @board.valid_pos?(new_pos) 
            next false if @board.empty?(new_pos)

            threatened_piece = @board[new_pos]
            threatened_piece && threatened_piece.colour != @colour
        end
    end
end

