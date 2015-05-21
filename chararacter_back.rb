require_relative 'die'
require_relative 'weapon'
require_relative 'armor'
class Character

  attr_accessor :name, :race, :hit_points, :strength, :agility, :weapon, :armor
  def initialize(name, race, hit_points, strength, agility, weapon, armor)
    @name = name
    @race = race
    @hit_points = hit_points
    @strength = strength
    @agility = agility
    @weapon = weapon
    @armor = armor
  end

  def current_status
    if @hit_points.to_i > 0
      @current_hit_points = @hit_points.to_i
    else
      @hit_points = 0
    end
    return @hit_points
  end

  def reduce_hits
    @armor_save = (@armor.hits.to_i / $d15.roll).to_i
    hit = (@strength.to_i * (1.0/$d4.roll) + @weapon.hits.to_i / $d8.roll).to_i
    if hit > @armor_save
      @hit_points = (@hit_points.to_i - (hit - @armor_save)).to_i
    else
      return hit   #..........................No damage taken
    end
    return hit
  end

  def revive_char
    @current_hit_points = @hit_points
  end

  def to_s

  end
end
