# Servidor LDAP
En esta actividad vamos a montar un servidor LDAP con openSUSE 13.2. Para ello necesitaremos las siguientes 2 máquinas virtuales:

* Un servidor openSUSE 13.2
* Un cliente openSUSE 13.2

## 1. Servidor LDAP
Comenzamos la instalación y configuración del servidor LDAP.

### 1.1. Preparativos
Esta máquina será uno de los openSUSE 13.2 y tendrá la siguiente configuración:

* IP estática: 172.18.16.31
* Nombre de equipo: *ldap-server16*

Debemos añadir en el fichero ***/etc/hosts*** los distintos nombres DNS que tendrá la máquina que actuará como servidor LDAP.



![012.png](./images/012.png)



Una vez configurada la máquina, ejecutamos y capturamos la salida de los siguientes comandos.

Comando ***date***

![001.png](./images/001.png)

Comando ***uname -a***

![002.png](./images/002.png)

Comando ***hostname -f***

![003.png](./images/003.png)

Comando ***hostname -a***

![004.png](./images/004.png)

Comando ***hostname -d***

![005.png](./images/005.png)

Comando ***tail -n 5 /etc/passwd***

![006.png](./images/006.png)

Comando ***ip a***

![007.png](./images/007.png)

Comando ***route -n***

![008.png](./images/008.png)

Comando ***ping -c4 8.8.4.4***

![009.png](./images/009.png)

Comando ***host www.iespuertodelacruz.es***

![010.png](./images/010.png)

Comando ***blkid***

![011.png](./images/011.png)

### 1.2. Instalación del Servidor LDAP

Procedemos a la instalación del módulo *yast2-auth-server*, que sirve para gestionar el servidor LDAP.

![013.png](./images/013.png)

Una vez instalado, aparecerá en *Yast* como *Authentication Server*.

![014.png](./images/014.png)

Al iniciarlo, es necesario instalar los paquetes *openldap2*, *krb5-server* y *krb5-client*.

![015.png](./images/015.png)

A continuación procedemos a configurar el servidor LDAP.

**Ajustes generales**

![016.png](./images/016.png)

**Tipo de servidor**

![017.png](./images/017.png)

**Configuración de TLS**

![018.png](./images/018.png)

**Configuración básica de la base de datos**

![019.png](./images/019.png)

**Autenticación Kerberos**

![020.png](./images/020.png)

**Resumen de la configuración**

![021.png](./images/021.png)

Una vez configurado el servicio LDAP, ejecutamos los siguientes comandos de comrobación.

Comando ***systemctl status slapd***

![022.png](./images/022.png)

Comando ***nmap localhost | grep -P '389|636'***

![024.png](./images/024.png)

Comando ***slapcat***

![025.png](./images/025.png)
![026.png](./images/026.png)
![027.png](./images/027.png)

Instalamos la herramienta *gq* con el comando ***zypper install gq*** y comprobamos que se han creado las unidades organizativas *groups* y *people*.

![028.png](./images/028.png)

### 1.3. Problemas

Si tenemos que desinstalar cualquier paquete hacemos:

* zypper remove yast2-auth-server
* zypper remove openldap2 krb5-server krb5-client
* mv /etc/openldap /etc/openldap.000
* mv /var/lib/ldap /var/lib/ldap.000

### 1.4. Crear usuarios y grupos LDAP

Ejecutamos *Yast* y buscamos *Gestión de usuarios y grupos*. En el interior de esta herramienta gráfica, utilizamos el filtro LDAP y creamos el grupo *piratas*, que contendrá los usuarios *pirata21* y *pirata22*.

![049.png](./images/049.png)

![048.png](./images/048.png)

Iniciamos *gq* y comprobamos que se han creado el grupo *piratas* y los usuarios *pirata21* y *pirata22*.

![050.png](./images/050.png)

## 2. Autenticación
En este punto vamos a escribir información en el servidor LDAP.

### 2.1. Preparativos
Esta máquina será uno de los openSUSE 13.2 y tendrá la siguiente configuración:

* IP estática: 172.18.16.32
* Nombre de equipo: *ldap-slave16*

Debemos añadir en el fichero ***/etc/hosts*** los distintos nombres DNS que tendrá la máquina que actuará como cliente del servicio LDAP.

![040.png](./images/040.png)

Una vez configurada la máquina, ejecutamos y capturamos la salida de los siguientes comandos.

Comando ***date***

![029.png](./images/029.png)

Comando ***uname -a***

![030.png](./images/030.png)

Comando ***hostname -f***

![031.png](./images/031.png)

Comando ***hostname -a***

![032.png](./images/032.png)

Comando ***hostname -d***

![033.png](./images/033.png)

Comando ***tail -n 5 /etc/passwd***

![034.png](./images/034.png)

Comando ***ip a***

![035.png](./images/035.png)

Comando ***route -n***

![036.png](./images/036.png)

Comando ***ping -c4 8.8.4.4***

![037.png](./images/037.png)

Comando ***host www.iespuertodelacruz.es***

![038.png](./images/038.png)

Comando ***blkid***

![039.png](./images/039.png)

Ejecutamos el comando ***nmap ldap-server16 | grep -P '389|636'***  para comprobar que el servidor LDAP es accesible desde el cliente.

![051.png](./images/051.png)

Debemos añadir el servidor LDAP en *gq* del cliente para poder utilizar los usuarios.

![052.png](./images/052.png)

Iniciamos *gq* en el cliente y comprobamos que se han creado el grupo *piratas* y los usuarios *pirata21* y *pirata22*.

![053.png](./images/053.png)

### 2.2. Instalar cliente LDAP

Debemos instalar el paquete *yast2-auth-client*, que nos ayudará a configurar la máquina para autenticación.

![041.png](./images/041.png)

En *Yast* aparecerá como *Authentication Client*.

![042.png](./images/042.png)

Iniciamos *Authentication Client* y procedemos a realizar la conexión con el servidor LDAP con las opciones que se indican a continuación.

![054.png](./images/054.png)

![055.png](./images/055.png)
