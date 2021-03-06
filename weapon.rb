class Weapon
  attr_accessor :name, :hits
  def initialize(name, hits)
    @name = name
    @hits = hits
  end

  def to_s
    return "#{@name} (providing #{@hits} hits of damage)"
  end
end
