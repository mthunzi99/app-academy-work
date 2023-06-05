class TowersOfHanoi
  attr_reader :stacks
  def initialize
    @stacks = [[3,2,1,], [], []]
  end

  def play
    display

    until won?
      begin
        puts 'Which tower do you want to move from?'
        from_tower = gets.to_i

        puts 'Which tower do you want to move to?'
        to_tower = gets.to_i

        move(from_tower, to_tower)
        display
      rescue StandardError => e
        puts e 
      end
    end

    puts 'You win!'    
  end

  def render
    "Tower 1: #{@stacks[0].join("  ")} " + "\n" +
    "Tower 2: #{@stacks[1].join("  ")} " + "\n" +
    "Tower 3: #{@stacks[2].join("  ")} "
  end

  def display
    system('cls') || system('clear')
    puts render
  end

  def move(from, to)
    from_tower, to_tower = from-1, to-1
    raise "Cannot move from an empty tower" if @stacks[from_tower].empty?
    raise "Cannot move disk onto smaller disk" unless valid_move?(from_tower, to_tower)
    
    @stacks[to_tower] << @stacks[from_tower].pop
  end

  def valid_move?(from, to)
    [from, to].all? { |i| i.between?(1, 3) }

    !@stacks[from].empty? && (@stacks[to].empty? || @stacks[to].last > @stacks[from].last)
  end

  def won?
    @stacks[1] == [3,2,1] || @stacks[2] == [3,2,1]
  end
end

if $PROGRAM_NAME == __FILE__
  towers = TowersOfHanoi.new
  towers.play
end