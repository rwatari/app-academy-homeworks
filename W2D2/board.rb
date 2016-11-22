class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.size.times do |idx|
      next if idx == 6 || idx == 13
      @cups[idx] = Array.new(4, :stone)
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0, 12) || cups[start_pos].empty?
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    num_stones = cups[start_pos].size
    cups[start_pos] = []
    pos = start_pos

    num_stones.times do
      pos = (pos + 1) % 14
      if (current_player_name == @name1 && pos == 13) ||
         (current_player_name == @name2 && pos == 6)
        pos = (pos + 1) % 14
      end
      cups[pos] << :stone
    end

    render
    next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].size == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
      true
    else
      false
    end
  end

  def winner
    case cups[6] <=> cups[13]
    when 0
      :draw
    when 1
      @name1
    when -1
      @name2
    end
  end
end
