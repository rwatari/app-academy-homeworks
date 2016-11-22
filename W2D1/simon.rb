class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    reset_game
  end

  def play
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    sleep(2)
    system("clear")
    require_sequence
    return if game_over
    round_success_message
    sleep(2)
    system("clear")
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    puts seq
  end

  def require_sequence
    sequence_length.times do |i|
      player_input = gets.chomp.downcase
      if seq[i] != player_input
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "You got it!"
  end

  def game_over_message
    puts "You lose!"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end
