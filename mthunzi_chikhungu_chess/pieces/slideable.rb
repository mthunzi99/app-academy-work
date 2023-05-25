module Slideable
    HORIZONTAL_AND_VERTICAL_DIRS = [ 
        [0, 1],
        [1, 0],
        [0, -1],
        [-1, 0]
    ]
    DIAGONAL_DIRS =[
        [1, 1],
        [1, -1],
        [-1, -1],
        [-1, 1]
    ]

    def horizontal_and_vertical_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves = []
        move_dirs.each do |dx, dy|
            all_moves.concat(grow_unblocked_moves_in_dir(dx, dy))
        end
        
        all_moves
    end

    private

    def move_dirs
        # Implemented by subclass
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        all_moves = []
        x, y = @pos


        while true
            x, y = x + dx, y + dy
            pos = [x, y]

            break unless @board.valid_pos?(pos)

            if @board.empty?(pos)
                all_moves << pos
            else
                all_moves << pos if @board[pos].color != color
                break
            end
        end

        all_moves
    end

end