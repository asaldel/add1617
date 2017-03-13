#!/usr/bin/ruby

if ARGV.size != 1
	puts "="*50
	puts "Usar el programa <delete-users.rb> con 1 argumento"
	puts "	filename : Nombre de un fichero"
	puts "="*50
	exit 1
end

filename = ARGV[0]
content  = `cat #{filename}`
users    = content.split("\n")

users.each do |i|
	puts "Borrando usuario #{i}"
	system("sudo userdel #{i}")
end