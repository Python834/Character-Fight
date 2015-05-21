class Die
  def initialize(num_sides)
    @num_sides = num_sides
  end

  def roll
    return rand(1..@num_sides).to_i
  end
end

$d4 = Die.new(4)
$d8 = Die.new(8)
$d10 = Die.new(10)
$d15 = Die.new(15)