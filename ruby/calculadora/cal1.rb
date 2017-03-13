#!/usr/bin/ruby

#datos
num1    = ARGV[0].to_i
op    	= ARGV[1]
num2    = ARGV[2].to_i

#codigo
if op == "+"
	res = num1 + num2
	puts "El resultado de #{num1} #{op} #{num2} es #{res}"

elsif op == "-"
	res = num1 - num2
	puts "El resultado de #{num1} #{op} #{num2} es #{res}"

elsif op == "x"
	res = num1 * num2
	puts "El resultado de #{num1} #{op} #{num2} es #{res}"

elsif op == "/"
	res = num1 / num2
	puts "El resultado de #{num1} #{op} #{num2} es #{res}"

else
	puts "¡Debe introducir el valor de num1!"
	puts "¡Debe introducir el valor de op!"
	puts "¡Debe introducir el valor de num2!"
end

