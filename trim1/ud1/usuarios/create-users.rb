#!/usr/bin/ruby

if ARGV.size != 1
	puts "="*50
	puts "Usar el programa <create-users.rb> con 1 argumento"
	puts "	filename : Nombre de un fichero"
	puts "="*50
	exit 1
end

directories = ["private","group","public"]
permissions = [700, 750, 755]

filename = ARGV[0]
content  = `cat #{filename}`
users    = content.split("\n")

actuser = `whoami`.chomp

if actuser != "root"
	puts "¡Necesitará privilegios de administrador para realizar esta acción!"
	exit 1

else 
	users.each do |i|
		system("useradd -d /home/#{i} -m #{i}")
		puts("Contraseña para el usuario #{i}")
		system("passwd #{i}")
		counter = 0
		directories.each do |j|
			system("mkdir /home/#{i}/#{j}")
			system("chmod #{permissions[counter]} /home/#{i}/#{j}")
			counter += 1
		end
	end
end