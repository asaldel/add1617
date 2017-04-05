# Tareas programadas

## 1. Windows
Vamos a hacer una tarea programada y otra diferida con Windows.

### 1.1. Configuración
Comando ***date***

![001.png](./images/001.png)

Comando ***hostname***

![002.png](./images/002.png)

Comando ***ipconfig***

![003.png](./images/003.png)

Comando ***route PRINT***

![004.png](./images/004.png)

Comando ***nslookup www.iespuertodelacruz.es***

![005.png](./images/005.png)

Comando ***ping 8.8.4.4***

![006.png](./images/006.png)

### 1.2. Tarea diferida
La tarea diferida se define para ejecutarse una sola vez en una fecha futura.

Vamos a programar una tarea diferida para que nos muestre un mensaje en pantalla. Para ello, vamos a *Panel de control -> Herramientas administrativas -> Programador de tareas*, y seleccionamos *Crear una tarea básica*.

![007.png](./images/007.png)

![008.png](./images/008.png)

![009.png](./images/009.png)

![010.png](./images/010.png)

![011.png](./images/011.png)

![012.png](./images/012.png)

![013.png](./images/013.png)

### 1.3. Tarea periódica
La tarea programada se define para ejecutarse periódicamente cada intervalo de tiempo.

Vamos a programar una tarea periódica para apagar el equipo.

![014.png](./images/014.png)

![015.png](./images/015.png)

![016.png](./images/016.png)

![017.png](./images/017.png)

![018.png](./images/018.png)

![019.png](./images/019.png)

![020.png](./images/020.png)

## 2. openSUSE
Vamos a hacer una tarea programada y otra diferida con GNU/Linux.

### 2.1. Configuración

Comando ***date***

![021.png](./images/021.png)

Comando ***uname -a***

![022.png](./images/022.png)

Comandos ***hostname -f***, ***hostname -a*** y ***hostname -d***

![023.png](./images/023.png)

Comando ***tail -n 5 /etc/passwd***

![024.png](./images/024.png)

Comando ***ip a***

![025.png](./images/025.png)

Comando ***route -n***

![026.png](./images/026.png)

Comando ***ping 8.8.4.4***

![027.png](./images/027.png)

Comando ***host www.iespuertodelacruz.es***

![028.png](./images/028.png)

Comando ***blkid***

![029.png](./images/029.png)

### 2.2. Tarea diferida
Creamos una tarea para las 12:50 que escriba el texto *'Hola Mundo'* en un fichero *README.txt*.

![030.png](./images/030.png)

Comprobamos que se ha creado dicho fichero y vemos su contenido.

![031.png](./images/031.png)

### 2.3. Tarea periódica
Vamos a programar una tarea periódica (crontab) para apagar el equipo.

Para programar una tarea periódica tenemos estas formas:

* Los usuarios usan el comando ***crontab*** para programar sus tareas.
* El usuario *root* usa el fichero */etc/crontab* para programar las tareas del sistema.

Como vamos a programar el apagado del sistema, usamos el fichero */etc/crontab*.

![032.png](./images/032.png)

Esta tarea apagará el sistema cada día a las 13:32.

![033.png](./images/033.png)
