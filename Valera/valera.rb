require 'yaml'

class Valera 
	attr_accessor :health #здоровье
	attr_accessor :mana #алкоголь
	attr_accessor :vivacity #жизнерадостность 
	attr_accessor :tiredness #усталость
	attr_accessor :money #деньги
	attr_accessor :death #смерть
	
	def init (args)
		@health = args[:health]
		@mana = args[:mana]
		@vivacity = args[:vivacity]
		@tiredness = args[:tiredness]
		@money = args[:money]
		@death = args[:death]
	end

	def death?
		return @death
	end
end
