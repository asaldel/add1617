#!/usr/bin/ruby

if ARGV.size != 1
	puts "="*61
	puts "Usar el programa <create-and-delete-users.rb> con 1 argumento"
	puts "	filename : Nombre de un fichero"
	puts "="*61
	exit 1
end

actuser = `whoami`.chomp

if actuser != "root"
	puts "¡Necesitará privilegios de administrador para realizar esta acción!"
	exit 1
end

filename = ARGV[0]
content  = `cat #{filename}`
users    = content.split("\n")

users.each do |data|
	fields = data.split(":")
	if fields[2] == ""
		puts("El usuario #{fields[0].capitalize} no tiene e-mail. No se realizará ninguna acción")
	
	elsif fields[4] == "add"
		system("useradd -d /home/#{fields[0]} -m #{fields[0]}")
		system("passwd #{fields[0]}")
		puts("Se ha creado el usuario #{fields[0].capitalize}")
	
	elsif fields[4] == "delete"
		system("userdel #{fields[0]}")
		system("rm -r /home/#{fields[0]}")
		puts("Se ha eliminado el usuario #{fields[0].capitalize}")
	end
end