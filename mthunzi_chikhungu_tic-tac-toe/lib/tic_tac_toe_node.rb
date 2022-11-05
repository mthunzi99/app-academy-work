require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark, @prev_move_pos = board, next_mover_mark, prev_move_pos
  end

  def losing_node?(evaluator)
    return @board.won? && @board.winner != evaluator if @board.over?

    if @next_mover_mark == evaluator
      children.all? { |node| node.losing_node?(evaluator) }
    else
      children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []

    (0...3).each do |x|
      (0...3).each do |y|
        pos = [x,y]
        next unless @board.empty?(pos) # Skips populated positions

        next_board = @board.dup
        next_board[pos] = @next_mover_mark
        next_mover_mark = (@next_mover_mark == :x ? :o : :x)
        nodes << TicTacToeNode.new(next_board, next_mover_mark, pos)
      end
    end

    nodes
  end
end
