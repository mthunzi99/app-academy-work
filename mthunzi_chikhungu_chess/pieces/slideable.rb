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
        move_dir
    end

    private

    def move_dir
        # Implemented by subclass
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        all_moves = []
        x, y = pos


        while true
            pos = [x + dx, y + dy]

            next unless board.valid_pos?(pos)

            if board[pos].empty?
                all_moves << pos
            else
                all_moves << pos if board[pos].colour != colour
                break
            end

            all_moves
        end

    end

end