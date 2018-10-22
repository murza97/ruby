require 'yaml'

class Stats
	def load(filename)
		YAML::load(File.open(filename))
	end
	
	def save(filename, valera)
		File.open(filename, 'w') { |file|
			file.puts("health: #{valera.health}")
			file.puts("mana: #{valera.mana}")
			file.puts("vivacity: #{valera.vivacity}")
			file.puts("tiredness: #{valera.tiredness}")
			file.puts("money: #{valera.money}")
		}
	end
end
