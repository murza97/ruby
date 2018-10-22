require 'colorize'
class View
  def welcome
    puts "Valera!\n"
  end
  
  def actions
    puts "Pick the action:"
    puts "1) Go_to_work\n"
    puts "2) Contemplate nature\n"
    puts "3) Drink vine and watch serials\n"
    puts "4) Go_to_bar\n"
    puts "5) Drink with other marginal people\n"
    puts "6) Sing in subway\n"
    puts "7) Sleep\n"
    puts "8) Save\n"
    puts "9) Load\n"
    puts "0) Exit\n"
  end
  
  def state(valera)
    puts "State of Valera:\n"
    print "Health = "
    if (valera.health >= 80) 
		print "#{valera.health}\n".colorize(:green)
    elsif (valera.health >= 30 && valera.health <  79) 
		print "#{valera.health}\n".colorize(:yellow)
    elsif (valera.health >= 0 && valera.health <  29)
		print "#{valera.health}\n".colorize(:light_red)
	end
	print "Mana = "
    if (valera.mana >= 80) 
		print "#{valera.mana}\n".colorize(:light_red)
    elsif (valera.mana >= 30 && valera.mana <  79) 
		print "#{valera.mana}\n".colorize(:yellow)
    elsif (valera.mana >= 0 && valera.mana <  29)
		print "#{valera.mana}\n".colorize(:green)
	end
    print "Vivacity = "
    if (valera.vivacity >= 80) 
		print "#{valera.vivacity}\n".colorize(:green)
    elsif (valera.vivacity >= 30 && valera.vivacity <  79) 
		print "#{valera.vivacity}\n".colorize(:yellow)
    elsif (valera.vivacity >= 0 && valera.vivacity <  29)
		print "#{valera.vivacity}\n".colorize(:light_red)
	end
    print "Tiredness = "
    if (valera.tiredness >= 80) 
		print "#{valera.tiredness}\n".colorize(:light_red)
    elsif (valera.tiredness >= 30 && valera.tiredness <  79) 
		print "#{valera.tiredness}\n".colorize(:yellow)
    elsif (valera.tiredness >= 0 && valera.tiredness <  29)
		print "#{valera.tiredness}\n".colorize(:green)
	end
    print "Money = "
    if (valera.money >= 80) 
		print "#{valera.money}\n".colorize(:green)
    elsif (valera.money >= 30 && valera.money <  79) 
		print "#{valera.money}\n".colorize(:yellow)
    elsif (valera.money >= 0 && valera.money <  29)
		print "#{valera.money}\n".colorize(:light_red)
	end
    puts "\n"
  end
  
  def death
    puts "Valera is dead\nGame Over...\n".red
  end
end
