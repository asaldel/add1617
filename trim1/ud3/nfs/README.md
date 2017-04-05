# NFS (Network File System)
NFS es un protocolo para compartir recursos en red entre sistemas heterogéneos.

## 1. SO Windows
Para esta parte vamos a necesitar las siguientes máquinas:

*  Servidor NFS
	* Windows 2012 Server
* Cliente NFS
	* openSUSE 13.2

### 1.1. Servidor NFS Windows
Esta máquina será un Windows 2012 Server y tendrá la siguiente configuración:

* IP estática: 172.18.16.21

![001.png](./images/001.png)

* Nombre de equipo y nombre de dominio

![002.png](./images/002.png)

Una vez configurada la máquina, ejecutamos los siguientes comandos de comprobación:

Comando ***date***

![003.png](./images/003.png)

Comando ***ipconfig***

![004.png](./images/004.png)

Comando ***ping 8.8.4.4***

![005.png](./images/005.png)

Comando *** nslookup www.iespuertodelacruz.es***

![006.png](./images/006.png)

Este comando no obtiene respuesta porque hemos establecido como servidor DNS primario la dirección IP 172.18.16.21, es decir, el servidor DNS primario de la máquina es la propia máquina, y debido a que ésta no es un servidor DNS, el comando no obtiene el resultado esperado.

#### 1.1.1. Instalación del servicio NFS
Procedemos a instalar el servicio NFS. Para ello vamos a *Roles y características*, agregamos el rol *Servidor de Archivos* y marcamos *Servidor para NFS*.

![007.png](./images/007.png)

![008.png](./images/008.png)

#### 1.1.2. Configurar el servidor NFS
Creamos la carpeta *C:\export16\public*. Picamos en la carpeta con el botón derecho -> Propiedades -> Compartir NFS, y la configuramos para que sea accesible desde la red en modo lectura/escritura con NFS.

![009.png](./images/009.png)

![010.png](./images/010.png)

Creamos la carpeta *C:\export16\private*. Picamos en la carpeta con el botón derecho -> Propiedades -> Compartir NFS, y la configuramos para que sea accesible desde la red sólo en modo sólo lectura.

![009.png](./images/009.png)

![011.png](./images/011.png)

Ejecutamos el comando ***showmount -e 172.18.16.21***, para comprobar que los recursos están exportados.

![012.png](./images/012.png)

### 1.2. Cliente NFS
Esta máquina será un openSUSE 13.2 y tendrá la siguiente configuración:

* IP estática: 172.18.16.32
* Nombre de equipo: *nfs-client-16*

Una vez configurada la máquina, ejecutamos los siguientes comandos de comprobación:

Comando ***date***

![013.png](./images/013.png)

Comando ***uname -a***

![014.png](./images/014.png)

Comando ***hostname -f***

![015.png](./images/015.png)

Comando ***hostname -a***

![016.png](./images/016.png)

Comando ***hostname -d***

![017.png](./images/017.png)

Comando ***tail -n 5 /etc/passwd***

![018.png](./images/018.png)

Comando ***ip a***

![019.png](./images/019.png)

Comando ***route -n***

![020.png](./images/020.png)

Comando ***ping -c4 8.8.4.4***

![021.png](./images/021.png)

Comando ***host www.iespuertodelacruz.es***

![022.png](./images/022.png)

Comando ***blkid***

![023.png](./images/023.png)

#### 1.2.1. Comprobar conectividad desde cliente al servidor

Comando ***ping -c4 172.18.16.21***

![024.png](./images/024.png)

Comando ***nmap 172.18.16.21 -Pn***

![025.png](./images/025.png)

Comando ***showmount -e 172.18.16.21***

![026.png](./images/026.png)

#### 1.2.2. Montar y usar cada recurso compartido desde el cliente
Creamos las carpetas */mnt/remoto16/public* y */mnt/remoto16/private*.

![027.png](./images/027.png)

Ejecutamos ***showmount -e 172.18.16.21*** para consultar los recursos que exporta el servidor.

![026.png](./images/026.png)

A continuación montamos cada recurso compartido en su directorio local correspondiente.

Comenzamos con el recurso compartido *public*. Ejecutamos ***mount.nfs 172.18.16.21:/public /mnt/remoto16/public*** para montarlo y ***df -hT*** para comprobar que se ha montado correctamente.

![028.png](./images/028.png)

Ahora vamos a crear ficheros/carpetas dentro del recurso *public*.

![029.png](./images/029.png)

Montamos ahora el recurso compartido *private* con el comando ***mount.nfs 172.18.16.21:/private /mnt/remoto16/private***. Ejecutamos ***df -hT*** para comprobar el montaje.

![030.png](./images/030.png)

Comprobamos que el recurso *private* es de sólo lectura.

![031.png](./images/031.png)

Lanzamos el comando *** netstat -ntap*** para comprobar el acceso a los recursos NFS desde el cliente.

![032.png](./images/032.png)

## 2. SO OpenSUSE
Vamos a necesitar las siguientes máquinas:

*  Servidor NFS
	* openSUSE 13.2
* Cliente NFS
	* openSUSE 13.2

### 2.1. Servidor NFS
Esta máquina será un openSUSE 13.2 y tendrá la siguiente configuración:

* IP estática: 172.18.16.31
* Nombre de equipo: *nfs-server-16*

Una vez configurada la máquina, ejecutamos los siguientes comandos de comprobación:

Comando ***date***

![033.png](./images/033.png)

Comando ***uname -a***

![034.png](./images/034.png)

Comando ***hostname -f***

![035.png](./images/035.png)

Comando ***hostname -a***

![036.png](./images/036.png)

Comando ***hostname -d***

![037.png](./images/037.png)

Comando ***tail -n 5 /etc/passwd***

![038.png](./images/038.png)

Comando ***ip a***

![039.png](./images/039.png)

Comando ***route -n***

![040.png](./images/040.png)

Comando ***ping -c4 8.8.4.4***

![041.png](./images/041.png)

Comando ***host www.iespuertodelacruz.es***

![042.png](./images/042.png)

Comando ***blkid***

![043.png](./images/043.png)

Comenzamos instalando el servicio *NFS* por Yast.

![044.png](./images/044.png)

Creamos las siguientes carpetas:

* */srv/export16/public*, usuario y grupo propietario nobody:nogroup

![045.png](./images/045.png)

* */srv/export16/private*, usuario y grupo propietario nobody:nogroup, permisos 770

![046.png](./images/046.png)

* Vamos configurar el servidor NFS de la siguiente forma:

	* La carpeta */srv/export16/public* será accesible desde toda la red en modo lectura/escritura.

	* La carpeta */srv/export16/private* será accesible sólo desde la IP del cliente, sólo en modo lectura.

Para ello usaremos o Yast o modificamos el fichero */etc/exports* añadiendo las siguientes líneas:

![047.png](./images/047.png)

Para reiniciar el servicio NFS usamos el comando ***systemctl restart nfsserver*** y el comando ***systemctl status nfsserver*** para comprobar el estado del servicio.

![048.png](./images/048.png)

Ejecutamos ***showmount -e localhost*** para mostrar la lista de recursos exportados por el servidor NFS.

![049.png](./images/049.png)

### 2.2. Cliente NFS
Esta máquina será un openSUSE 13.2 y tendrá la siguiente configuración:

* IP estática: 172.18.16.32
* Nombre de equipo: *nfs-client-16*

Una vez configurada la máquina, ejecutamos los siguientes comandos de comprobación:

Comando ***date***

![062.png](./images/062.png)

Comando ***uname -a***

![063.png](./images/063.png)

Comando ***hostname -f***

![064.png](./images/064.png)

Comando ***hostname -a***

![065.png](./images/065.png)

Comando ***hostname -d***

![066.png](./images/066.png)

Comando ***tail -n 5 /etc/passwd***

![067.png](./images/067.png)

Comando ***ip a***

![068.png](./images/068.png)

Comando ***route -n***

![069.png](./images/069.png)

Comando ***ping -c4 8.8.4.4***

![070.png](./images/070.png)

Comando ***host www.iespuertodelacruz.es***

![071.png](./images/071.png)

Comando ***blkid***

![072.png](./images/072.png)

#### 2.2.1. Comprobar conectividad desde cliente al servidor

Comando ***ping -c4 172.18.16.31***

![050.png](./images/050.png)

Comando ***nmap 172.18.16.31 -Pn***

![051.png](./images/051.png)

Comando ***showmount -e 172.18.16.31***

![052.png](./images/052.png)

#### 2.2.2. Montar y usar cada recurso compartido desde el cliente
Creamos las carpetas */mnt/remoto16/public* y */mnt/remoto16/private*.

![053.png](./images/053.png)

Ejecutamos ***showmount -e 172.18.16.31*** para consultar los recursos que exporta el servidor.

![052.png](./images/052.png)

A continuación montamos cada recurso compartido en su directorio local correspondiente.

Comenzamos con el recurso compartido *public*. Ejecutamos ***mount.nfs 172.18.16.31:/public /mnt/remoto16/public*** para montarlo y ***df -hT*** para comprobar que se ha montado correctamente.

![054.png](./images/054.png)

Ahora vamos a crear ficheros/carpetas dentro del recurso *public*.

![056.png](./images/055.png)

Montamos ahora el recurso compartido *private* con el comando ***mount.nfs 172.18.16.31:/private /mnt/remoto16/private***. Ejecutamos ***df -hT*** para comprobar el montaje.

![056.png](./images/056.png)

Comprobamos que el recurso *private* es de sólo lectura.

![057.png](./images/057.png)

Lanzamos el comando *** netstat -ntap*** para comprobar el acceso a los recursos NFS desde el cliente.

![058.png](./images/058.png)

### 2.3 Montaje automático
Acabamos de acceder a recursos remotos realizando un montaje de forma manual. Si reiniciamos el equipo cliente podremos ver que los montajes realizados de forma manual ya no están. Si queremos volver a acceder a los recursos remotos debemos repetir el proceso, a no ser que hagamos una configuración permanente o automática.

Vamos a configurar el montaje autoḿatico para el recurso compartido *public*.

Usamos Yast -> particionador -> NFS -> Añadir. Introducimos la dirección IP de la máquina en la que se encuentra el recurso compartido, el directorio remoto donde se encuentra el recurso y el directorio local donde se va a montar el recurso.

![059.png](./images/059.png)

Vemos el montaje anterior en el fichero ***/etc/fstab***.

![060.png](./images/060.png)

Reiniciamos la máquina y ejecutamos el comando ***df -hT*** para comprobar el montaje del recurso compartido *public*.

![061.png](./images/061.png)

## 3. Preguntas
* ¿Nuestro cliente GNU/Linux NFS puede acceder al servidor Windows NFS? Si. Esta combinación la hemos realizado en el apartado 1.2 de la actividad.
* ¿Nuestro cliente Windows NFS podría acceder al servidor GNU/Linux NFS? No. Al usar una versión *Professional* de Windows 7, no se permite la instalación del servicio cliente para NFS.
* Fijarse en los valores de usuarios propietario y grupo propietario de los ficheros que se guardan en el servidor NFS, cuando los creamos desde una conexión cliente NFS.

![073.png](./images/073.png)
