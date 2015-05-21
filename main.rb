############################################################
#
#  Name:        Patrick McManis
#  Assignment:  Character Fight
#  Date:        5/19/2014
#  Class        CIS 283
#  Description: Create a virtual character fight
#
############################################################
require_relative 'character'
require_relative 'die'
require_relative 'weapon'
require_relative 'armor'

def menu
  puts
  puts '1)	Load Character 1'
  puts '2)	Load Character 2'
  puts '3)	Fight'
  puts '4)	Quit'
  return gets.to_i
end

while (user_selection = menu) != 4
  if user_selection > 0
    if user_selection == 1
      puts
      print 'Enter character name: '
      char_load = gets.chomp.downcase
      if File.exist?("#{char_load}.txt")
        character1 = File.open("#{char_load}.txt")
          wep_info = character1.readlines[1].chomp.split(',')
          wep = Weapon.new(wep_info[0], wep_info[1])
        character1.close

        character1 = File.open("#{char_load}.txt")
          arm_info = character1.readlines[2].chomp.split(',')
          arm = Armor.new(arm_info[0], arm_info[1])
        character1.close

        character1 = File.open("#{char_load}.txt")
          char_info = character1.readlines[0].chomp.split(',')
          char = Character.new(char_info[0], char_info[1], char_info[2], char_info[3], char_info[4], wep, arm)
        character1.close

        puts char.to_s
      else
        puts 'Character not found!'
      end

    elsif user_selection == 2
      puts
      print 'Enter character name: '
      char_load = gets.chomp.downcase
      if File.exist?("#{char_load}.txt")
        character2 = File.open("#{char_load}.txt")
          wep_info = character2.readlines[1].chomp.split(',')
          wep = Weapon.new(wep_info[0], wep_info[1])
        character2.close

        character2 = File.open("#{char_load}.txt")
          arm_info = character2.readlines[2].chomp.split(',')
          arm = Armor.new(arm_info[0], arm_info[1])
        character2.close

        character2 = File.open("#{char_load}.txt")
          char_info = character2.readlines[0].chomp.split(',')
          char2 = Character.new(char_info[0], char_info[1], char_info[2], char_info[3], char_info[4], wep, arm)
        character2.close

        puts char2.to_s
      else
        puts 'Character not found!'
      end

    elsif user_selection == 3
      puts
        char.revive_char
        char2.revive_char
        while char.hit_points.to_i > 0 && char2.hit_points.to_i > 0

          char1_die = Die.new(char.agility.to_i)
          char1_roll = char1_die.roll
          puts "#{char.name} rolled a #{char1_roll}"

          char2_die = Die.new(char2.agility.to_i)
          char2_roll = char2_die.roll
          puts "#{char2.name} rolled a #{char2_roll}"

          if char1_roll > char2_roll

            puts "#{char.name} attacks first!"
            puts
            if $d10.roll < char.agility.to_i
              armor_save = char2.armor.hits.to_i / $d15.roll.to_i
              hit = (char.strength.to_i * (1.0/$d4.roll) + char.weapon.hits.to_i / $d8.roll).to_i

              puts "#{char.name} deals #{hit} damage and #{char2.name} saves for #{armor_save}"
              puts "#{char2.name} takes #{char2.reduce_hits(hit, armor_save)} damage and has #{char2.current_status} hits left."
              puts
            else
              puts "#{char.name} misses!"
              puts
            end

          else

            puts "#{char2.name} attacks first"
            puts
            if $d10.roll < char2.agility.to_i
              armor_save = char.armor.hits.to_i / $d15.roll.to_i
              hit = (char2.strength.to_i * (1.0/$d4.roll) + char2.weapon.hits.to_i / $d8.roll).to_i

              puts "#{char2.name} deals #{hit} damage and #{char.name} saves for #{armor_save}"
              puts "#{char.name} takes #{char.reduce_hits(hit, armor_save)} damage and has #{char.current_status} hits left."
              puts
            else
              puts "#{char2.name} misses!"
              puts
            end
          end

        if char1_roll > char2_roll
          if char2.hit_points.to_i > 0
            puts "#{char2.name} attacks"
            puts
            if $d10.roll < char2.agility.to_i
              armor_save = char.armor.hits.to_i / $d15.roll.to_i
              hit = (char2.strength.to_i * (1.0/$d4.roll) + char2.weapon.hits.to_i / $d8.roll).to_i

              puts "#{char2.name} deals #{hit} damage and #{char.name} saves for #{armor_save}"
              puts "#{char.name} takes #{char.reduce_hits(hit, armor_save)} damage and has #{char.current_status} hits left."
              puts
            else
              puts "#{char2.name} misses!"
              puts
            end
          end
        else
          if char.hit_points.to_i > 0
            puts "#{char.name} attacks"
            puts
            if $d10.roll < char.agility.to_i
              armor_save = char2.armor.hits.to_i / $d15.roll.to_i
              hit = (char.strength.to_i * (1.0/$d4.roll) + char.weapon.hits.to_i / $d8.roll).to_i

              puts "#{char.name} deals #{hit} damage and #{char2.name} saves for #{armor_save}"
              puts "#{char2.name} takes #{char2.reduce_hits(hit, armor_save)} damage and has #{char2.current_status} hits left."
              puts
            else
              puts "#{char.name} misses!"
              puts
            end
          end
        end
          gets
        end
        if char.hit_points.to_i > char2.hit_points.to_i
          puts "#{char.name} Wins!"
        else
          puts "#{char2.name} Wins!"
        end
      #end
    end
  else
    puts
    puts 'Please enter valid menu option.'
  end

end
