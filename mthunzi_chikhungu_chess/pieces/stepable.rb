module Stepable
    def moves
        all_moves = []
        move_diffs.each do |(dx, dy)|
            x, y = pos
            pos = [(x + dx), (y + dy)]

            next unless valid_pos?(pos)

            if board.empty?(pos)
                all_moves << pos
            elsif board[pos].colour != colour
                all_moves << pos
            end
            
            all_moves
        end
    end

    def move_diffs
        # Implemented by subclass
        raise NotImplementedError
    end
end