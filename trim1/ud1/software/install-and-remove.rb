#!/usr/bin/ruby

if ARGV.size != 1
	puts "="*56
	puts "Usar el programa <install-and-remove.rb> con 1 argumento"
	puts "	filename : Nombre de un fichero"
	puts "="*56
	exit 1
end

actuser = `whoami`.chomp
if actuser != "root"
	puts "¡Necesitará privilegios de administrador para realizar esta acción!"
	exit 1
end

filename = ARGV[0]
content  = `cat #{filename}`
rows     = content.split("\n")

rows.each do |software|
	fields = software.split(":")
	status = `whereis #{fields[0]} |grep bin |wc -l`.to_i
	
	if fields[1] == "remove" or fields[1] == "r"
		if status == 0
			puts("El paquete #{fields[0].capitalize} no está instalado")
		else
			`apt-get remove -y #{fields[0]}`
			puts("Se ha desinstalado el paquete #{fields[0].capitalize}")
		end

	elsif fields[1] == "install" or fields[1] == "i"
		if status == 0
			`apt-get install -y #{fields[0]}`
			puts("Se ha instalado el paquete #{fields[0].capitalize}")
		else
			puts("El paquete #{fields[0].capitalize} ya está instalado")
		end

	elsif fields[1] == "status" or fields[1] == "s"
		if status == 0
			puts("El paquete #{fields[0].capitalize} no está instalado")
		else
			puts("El paquete #{fields[0].capitalize} está instalado")
		end
	
	else
		puts("Error sintáctico en el fichero #{filename} -> Paquete: #{fields[0]}")
	end
	
end