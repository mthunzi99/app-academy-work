require_relative 'piece'

class Pawn < Piece

    def symbol
        '♟'.colorize(color)
    end

    def moves
        forward_steps
    end

    private

    def at_start_row?
        
    end

    def forward_dir

    end

    def forward_steps

    end

    def side_attacks

    end

end

