require_relative 'valera.rb'
require_relative 'state.rb'
require_relative 'actions.rb'
require_relative 'view.rb'

state = Stats.new
yml = state.load("state.yml")
#начальные статы Валеры загружаем из файла + то, что он жив (death = 0)

valera = Valera.new
valera.init({:health => yml['health'], :mana => yml['mana'], :vivacity => yml['vivacity'], :tiredness => yml['tiredness'], :money => yml['money'], :death => 0})

view = View.new
  
while valera.death? != 1
  view.state(valera)
  view.actions
  print "> "
  action_choise = gets.chomp
  
  action = Actions.new
  action.init
  
  case action_choise
    when "1"
	  if (valera.mana > 50 && valera.tiredness > 10)
	    puts "Valera is tired and drunk that to work\n"
      else
	    puts "Valera goes to work\n"
	    action.go_to_work(valera)
	    puts "Valera returned from work.\n"
	  end
    when "2"
      puts "Valera contemplates the nature\n"
      action.contemplate_nature(valera)
      puts "Valera returned to home.\n"
    when "3"
      if valera.money < 20
        puts "No enough money!!! :(\n"
      else
        puts "Valera watch favourite serial and drink some vine\n"
        action.drink_vine_and_watch_serials(valera)
        puts "Valera is finished\n"
      end
    when "4"
      if valera.money < 100
        puts "No enough money!!! :(\n"
      else
        puts "Valera goes to bar\n"
        action.go_to_bar(valera)
        puts "Valera drunk and returned to home\n"
      end
    when "5"
      if valera.money < 150
        puts "No enough money!!! :(\n"
      else
        puts "Valera goes to party"
        action.drink_with_other_marginal_people(valera)
        puts "Valera drunk and returned to home\n"
      end
    when "6"
      if (valera.mana > 40 && valera.mana < 70)
        puts "Valera is right condition\n"
      else
        puts "Valera is not right condition\n:(\n"
      end 
      action.sing_in_subway(valera) 
      puts "Valera singed in subway and returned to home\n"
    when "7"
      if (valera.mana < 30)
        puts "Valera get enough sleep!\n"
      else
        puts "Valera get not enough sleep!\n"
      end  
      action.sleep(valera)
      puts "Valera wake up\n"
    when "8"
      puts "Valera is saved.\n"
      state.save('save.yml', valera)
    when "9"
      state = Stats.new
      puts "Valera is loaded.\n"
      yml = state.load("save.yml")
      valera = Valera.new
	  valera.init({:health => yml['health'], :mana => yml['mana'], :vivacity => yml['vivacity'], :tiredness => yml['tiredness'], :money => yml['money'], :death => 0})
    when "0"
      puts "Exit.\n"
      valera.death = 1
    else
      puts "No such actions!\n"
  end
end
