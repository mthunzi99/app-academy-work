class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq, :score

  def initialize
    @sequence_length, @game_over, @seq = 1, false, []
    @score = 0
  end

  def play
    system("cls") || system("clear")

    until @game_over
      take_turn
      system("cls") || system("clear")
    end

    game_over_message
    score
    sleep(4)
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    return if @game_over

    round_success_message
    @score += 1
    score
    @sequence_length += 1

    sleep(2)
  end

  def show_sequence
    add_random_color

    @seq.each do |clr|
      puts clr
      sleep(1.5)
      system("cls") || system("clear")
      sleep(0.3)
    end
  end

  def require_sequence
    puts "repeat the colour sequence using the first letter of the colour"
    puts "red => r, blue => b, green => g, yellow => y (press 'Enter' after each colour)"

    sequence = seq.map { |clr| clr[0] }

    @sequence_length.times do |num|
      color = gets.chomp

      if sequence[num] != color
        @game_over = true
        return
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Correct!!"
  end

  def score
    puts "Score: #{@score}"
  end

  def game_over_message
    puts "Sorry you got that wrong"
  end

  def reset_game
    @sequence_length, @game_over, @seq = 1, false, []
  end
end


if $PROGRAM_NAME == __FILE__
  game = Simon.new
  game.play
end 