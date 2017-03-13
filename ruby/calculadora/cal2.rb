#!/usr/bin/ruby

#datos
fichero    = ARGV[0]

filename = 'operaciones.txt'
content  = `cat #{filename}`
operaciones = content.split("\n")

#comprobaciones
if fichero == nil
	puts "¡Falta poner el nombre del fichero!"
	exit
end

#codigo
operaciones.each do |i|
	items = i.split(" ")

	num1    = items[0].to_i
	op    	= items[1]
	num2    = items[2].to_i

	if op == "+"
		res = num1 + num2
		puts "El resultado de la operación #{i} es #{res}"
	
	elsif op == "-"
		res = num1 - num2
		puts "El resultado de la operación #{i} es #{res}"

	elsif op == "x"
		res = num1 * num2
		puts "El resultado de la operación #{i} es #{res}"

	elsif op == "/"
		res = num1 / num2
		puts "El resultado de la operación #{i} es #{res}"
	end

end



