#!/usr/bin/murza97 ruby
require 'csv'

if __FILE__ == $0
	stat = CSV.read('./demo11.csv')[1]
	stat = stat.collect {|i| i.to_f}
	puts "Enter operation : Мах,Min,Aver,\Disp"
	action = gets.chomp.downcase
	case action
	when "max"
		puts "Max = #{stat.max}" 
		exit
	when "min"
		puts "Max = #{stat.min}"
		exit
	when "aver"
		aver = stat.reduce(:+) / stat.size.to_f 
		puts "Averege = #{aver}"
		exit
	when "disp"
		aver_select = (stat.max - stat.min) / 2.0
 		disp = 0.0
  		stat.each do |number|
    		disp += (number - aver_select) ** 2 
  		end
  		puts "Disp = #{disp/stat.size.to_f}"
		exit
	end
	puts "Error! Unknown operation!"
end
