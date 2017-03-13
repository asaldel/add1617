#Acceso remoto VNC

Para realizar esta actividad usaremos máquinas virtuales con openSUSE 13.2, Windows 7 y Windows 2012 Server.

##1. Configuración de las máquinas virtuales
###1.1. Windows 7
* Configuración de red

![Configuración de red](./images/001.png)

* Nombre de equipo y grupo de trabajo

![Nombre de equipo y grupo de trabajo](./images/002.png)

###1.2. Windows 2012 Server
* Configuración de red

![Configuración de red](./images/003.png)

* Nombre de equipo y grupo de trabajo

![Nombre de equipo y grupo de trabajo](./images/004.png)

###1.3. openSUSE 13.2 Server
* Configuración de red

![Configuración de red](./images/005.png)

![Configuración de red](./images/007.png)

* Nombre de equipo y grupo de trabajo

![Nombre de equipo y grupo de trabajo](./images/006.png)

###1.4. openSUSE 13.2 Cliente
* Configuración de red

![Configuración de red](./images/008.png)

![Configuración de red](./images/010.png)

* Nombre de equipo y grupo de trabajo

![Nombre de equipo y grupo de trabajo](./images/009.png)

##2. Conexiones remotas con VNC
Vamos a realizar las siguientes conexiones remotas VNC:
###2.1. Acceder a Windows 2012 Server desde Windows 7
Desde Windows 7 ejecutamos ***TightVNC Viewer*** e introducimos la dirección IP del Windows Server 2012.

![TightVNC Viewer Win7](./images/011.png)

Una vez introducida la dirección IP, pulsamos en *Connect*, y establecemos la contraseña que hemos designado en la configuración.

![TightVNC Viewer Win7](./images/012.png)

Pulsamos *OK* y vemos como se ha establecido la conexión remota entre las dos máquinas.

![TightVNC Viewer Win7](./images/013.png)

Para comprobar la conexión entre las dos máquinas, ejecutamos el comando ***netstat -n***.

![Comando netstat -n](./images/014.png)

###2.2. Acceder a Windows 2012 Server desde openSUSE 13.2
En una terminal de la consola, y como superusuario, ejecutamos ***vncviewer*** para comenzar la conexión remota.
Comenzamos introduciendo la dirección IP del Windows 2012 Server. 

![vncviewer opensuse13.2](./images/015.png)

A continuación, establecemos la contraseña designada para el acceso remoto.

![vncviewer opensuse13.2](./images/016.png)

Pulsamos *OK* y vemos como se ha establecido la conexión remota entre las dos máquinas.

![vncviewer opensuse13.2](./images/017.png)

Para comprobar la conexión entre las dos máquinas, ejecutamos el comando ***netstat -ntap***.

![comando netstat -ntap](./images/018.png)

###2.3. Acceder a OpenSUSE 13.2 desde OpenSUSE 13.2
En una terminal de la consola, y como superusuario, ejecutamos ***vncviewer*** para comenzar la conexión remota.
Comenzamos introduciendo la dirección IP del openSUSE 13.2 que queremos conectar acompañada del puerto por el que se va a acceder. 

![vncviewer opensuse13.2](./images/019.png)

Pulsamos en *Connect* y vemos la conexión establecida entre ambas máquinas virtuales.

![vncviewer opensuse13.2](./images/021.png)

Para comprobar el estado de la conexión, ejecutamos el comando ***netstat -ntap***.

![comando netstat -ntap](./images/022.png)


###2.4. Acceder a OpenSUSE 13.2 desde Windows 7
Ejecutamos ***TightVNC Viewer*** y ponemos la dirección IP de la máquina openSUSE 13.2, con el puerto por el que se va a acceder.

![TightVNC Viewer Win7](./images/020.png)

Pulsamos en *Connect* y vemos la conexión establecida entre ambas máquinas.

![TightVNC Viewer Win7](./images/023.png)

Para finalizar, comprobamos la conexión con ***netstat -n***.

![comando ntetstat -n](./images/024.png)



















