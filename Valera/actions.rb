require "rubygems"
require 'yaml'
require "test/unit"
require_relative 'valera.rb'
require_relative 'state.rb'
require_relative 'actions.rb'
require_relative 'view.rb'

class Actions #класс управления действиями Валеры
  def init
    #создание файлов с конфигурацией каждого действия
    @state = Stats.new #объект для работы с YAML
    @yml = @state.load("actions.yml")
  end
  
  def go_to_work(valera) #пойти на работу
    valera.mana += @yml['go_to_work']['mana']
    valera.mana = 0 if valera.mana < 0  
    valera.money += @yml['go_to_work']['money']
    valera.vivacity += @yml['go_to_work']['vivacity']
    valera.vivacity = -10 if valera.vivacity < -10
    valera.tiredness += @yml['go_to_work']['tiredness']
    valera.tiredness = 100 if valera.tiredness > 100 
  end
  
  def contemplate_nature(valera) #созерцать природу
    valera.mana += @yml['contemplate_nature']['mana']
    valera.mana = 0 if valera.mana < 0  
    valera.vivacity += @yml['contemplate_nature']['vivacity']
    valera.vivacity = 10 if valera.vivacity > 10
    valera.tiredness += @yml['contemplate_nature']['tiredness']
    valera.tiredness = 100 if valera.tiredness > 100
  end
  
  def drink_vine_and_watch_serials(valera) #пить вино и смотреть сериал
    valera.mana += @yml['drink_vine_and_watch_serials']['mana']
    valera.mana = 100 if valera.mana > 100  
    valera.vivacity += @yml['drink_vine_and_watch_serials']['vivacity']
    valera.vivacity = -10 if valera.vivacity < -10
    valera.tiredness += @yml['drink_vine_and_watch_serials']['tiredness']
    valera.tiredness = 100 if valera.tiredness > 100
    valera.health += @yml['drink_vine_and_watch_serials']['health']
    if valera.health <= 0
      valera.health = 0 
      valera.death = 1
    end
    valera.money += @yml['drink_vine_and_watch_serials']['money']
  end
  
  def go_to_bar(valera) #сходить в бар
    valera.mana += @yml['go_to_bar']['mana']
    valera.mana = 100 if valera.mana > 100  
    valera.vivacity += @yml['go_to_bar']['vivacity']
    valera.vivacity = 10 if valera.vivacity > 10
    valera.tiredness += @yml['go_to_bar']['tiredness']
    valera.tiredness = 100 if valera.tiredness > 100
    valera.health += @yml['go_to_bar']['health']
    if valera.health <= 0
      valera.health = 0 
      valera.death = 1
    end
    valera.money += @yml['go_to_bar']['money']
  end
  
  def drink_with_other_marginal_people(valera) #выпить с маргинальными личностями
    valera.mana += @yml['drink_with_other_marginal_people']['mana']
    valera.mana = 100 if valera.mana > 100  
    valera.vivacity += @yml['drink_with_other_marginal_people']['vivacity']
    valera.vivacity = 10 if valera.vivacity > 10
    valera.tiredness += @yml['drink_with_other_marginal_people']['tiredness']
    valera.tiredness = 100 if valera.tiredness > 100
    valera.health += @yml['drink_with_other_marginal_people']['health']
    if valera.health <= 0
      valera.health = 0 
      valera.death = 1
    end
    valera.money += @yml['drink_with_other_marginal_people']['money']
  end
  
  def sing_in_subway(valera) #петь в метро
    if (valera.mana > 40 && valera.mana < 70)
      valera.money += @yml['sing_in_subway']['money1']
    else
      valera.money += @yml['sing_in_subway']['money2']
    end
    valera.mana += @yml['sing_in_subway']['mana']
    valera.mana = 100 if valera.mana > 100  
    valera.vivacity += @yml['sing_in_subway']['vivacity']
    valera.vivacity = 10 if valera.vivacity > 10
    valera.tiredness += @yml['sing_in_subway']['tiredness']
    valera.tiredness = 100 if valera.tiredness > 100
  end
  
  def sleep(valera) #спать
    if (valera.mana < 30) 
		valera.health += @yml['sleep']['health'] 
	end
    if (valera.health > 100) 
		valera.health = 100 
	end
    valera.mana += @yml['sleep']['mana']
    if (valera.mana < 0) 
		valera.mana = 0 
    end
    if (valera.mana > 70) 
		valera.vivacity += @yml['sleep']['vivacity'] 
    end
    if (valera.vivacity < -10) 
		valera.vivacity = -10 
    end
    valera.tiredness += @yml['sleep']['tiredness']
    if (valera.tiredness < 0)
		valera.tiredness = 0 
	end
  end  
end
