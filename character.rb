require_relative 'die'
require_relative 'weapon'
require_relative 'armor'
class Character

  attr_accessor :name, :race, :hit_points, :strength, :agility, :weapon, :armor
  def initialize(name, race, hit_points, strength, agility, weapon, armor)
    @name = name
    @race = race
    @revive = hit_points
    @hit_points = hit_points
    @strength = strength
    @agility = agility
    @weapon = weapon
    @armor = armor
  end

  def current_status
    if @hit_points.to_i > 0
      return @hit_points
    else
      @hit_points = 0
      return @hit_points
    end

  end

  def reduce_hits(hit, armor_save)
    if hit > armor_save
      @hit_points= (@hit_points.to_i - (hit - armor_save)).to_i
      return hit - armor_save
    else
      return 'no'
    end
  end

  def revive_char
    @hit_points = @revive
  end

  def to_s
    return @name + ":\t" + @race + "\n" +
    "\t" + "\t" + 'has a strength of ' + @strength + "\n" +
    "\t" + "\t"  'agility of ' + @agility + "\n" +
    "\t" + "\t" + 'has ' + @hit_points + ' hits left' + "\n" +
    "\t" + "\t" + 'wearing: ' + @armor.to_s + "\n" +
    "\t" + "\t" + 'wielding a(n): ' + @weapon.to_s
  end
end
#
# character1 = File.open("gimli.txt")
# wep_info = character1.readlines[1].chomp.split(',')
# wep = Weapon.new(wep_info[0], wep_info[1])
# character1.close
#
# character1 = File.open("gimli.txt")
# arm_info = character1.readlines[2].chomp.split(',')
# arm = Armor.new(arm_info[0], arm_info[1])
# character1.close
#
# character1 = File.open("gimli.txt")
# char_info = character1.readlines[0].chomp.split(',')
# char = Character.new(char_info[0], char_info[1], char_info[2], char_info[3], char_info[4], wep, arm)
# character1.close
#
# character2 = File.open("legolas.txt")
# wep_info = character2.readlines[1].chomp.split(',')
# wep = Weapon.new(wep_info[0], wep_info[1])
# character2.close
#
# character2 = File.open("legolas.txt")
# arm_info = character2.readlines[2].chomp.split(',')
# arm = Armor.new(arm_info[0], arm_info[1])
# character2.close
#
# character2 = File.open("legolas.txt")
# char_info = character2.readlines[0].split(',')
# char2 = Character.new(char_info[0], char_info[1], char_info[2], char_info[3], char_info[4], wep, arm)
# character2.close
#
#
#     while char.hit_points.to_i > 0 && char2.hit_points.to_i > 0
#
#       char1_die = Die.new(char.agility.to_i)
#       char1_roll = char1_die.roll
#       puts "#{char.name} rolled a #{char1_roll}"
#
#       char2_die = Die.new(char2.agility.to_i)
#       char2_roll = char2_die.roll
#       puts "#{char2.name} rolled a #{char2_roll}"
#
#       if char1_roll > char2_roll
#
#     puts "#{char.name} attacks first!"
#     if $d10.roll < char.agility.to_i
#       armor_save = char2.armor.hits.to_i / $d15.roll.to_i
#       hit = (char.strength.to_i * (1.0/$d4.roll) + char.weapon.hits.to_i / $d8.roll).to_i
#
#       puts "#{char.name} deals #{hit} and #{char2.name} saves for #{armor_save}"
#       puts "#{char2.name} takes #{char2.reduce_hits(hit, armor_save)} damage and has #{char2.current_status} hits left."
#     else
#       puts "#{char.name} misses!"
#     end
#
#   else
#
#     puts "#{char2.name} attacks first"
#     if $d10.roll < char2.agility.to_i
#       armor_save = char.armor.hits.to_i / $d15.roll.to_i
#       hit = (char2.strength.to_i * (1.0/$d4.roll) + char2.weapon.hits.to_i / $d8.roll).to_i
#
#       puts "#{char2.name} deals #{hit} and #{char.name} saves for #{armor_save}"
#       puts "#{char.name} takes #{char.reduce_hits(hit, armor_save)} damage and has #{char.current_status} hits left."
#     else
#       puts "#{char2.name} misses!"
#     end
#   end
#
#   if char1_roll > char2_roll
#     puts "#{char2.name} attacks"
#     if $d10.roll < char2.agility.to_i
#       armor_save = char.armor.hits.to_i / $d15.roll.to_i
#       hit = (char2.strength.to_i * (1.0/$d4.roll) + char2.weapon.hits.to_i / $d8.roll).to_i
#
#       puts "#{char2.name} deals #{hit} and #{char.name} saves for #{armor_save}"
#       puts "#{char.name} takes #{char.reduce_hits(hit, armor_save)} damage and has #{char.current_status} hits left."
#     else
#       puts "#{char2.name} misses!"
#     end
#   else
#     puts "#{char.name} attacks"
#     if $d10.roll < char.agility.to_i
#       armor_save = char2.armor.hits.to_i / $d15.roll.to_i
#       hit = (char.strength.to_i * (1.0/$d4.roll) + char.weapon.hits.to_i / $d8.roll).to_i
#
#       puts "#{char.name} deals #{hit} and #{char2.name} saves for #{armor_save}"
#       puts "#{char2.name} takes #{char2.reduce_hits(hit, armor_save)} damage and has #{char2.current_status} hits left."
#     else
#       puts "#{char.name} misses!"
#     end
#   end
#   gets
# end
