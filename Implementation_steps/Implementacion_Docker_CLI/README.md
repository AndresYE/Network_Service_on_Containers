# Implementación Docker CLI
## Construcción de Imagenes Docker
1. Como primer paso de la implementación se emplea el software WinSCP, el cual usa para la transferencia de los ficheros Dockerfile mediante conexión SSH.



2. Crear un directorio "Docker" en la ruta "/home/pi/".



3. Colocar los ficheros Dockerfile y dependencias en un directorio con el nombre del servicio.



4. Iniciar conexión SSH empleando el software Putty.



5. Realizar un listado del directorio "/home/pi/Docker"



6. Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker build" respectivos para contruir las imagenes de los contenedores a partir de los ficheros Dockerfile y sus dependencias asociadas.
- **DHCP:**



- **DNS:**


- **FTP:**



- **HTTP:**



7. Descargar las imagenes de los contenedores asociados a los servicios de Rputing y VoIP, mediante el comando.

```shell
docker pull repository[:tag]
```
Donde:
- ** repository:** Es el nombre del repositorio y la etiquete de la imagen.
- **VoIP**

- **Routing**



8. Verificar las imagenes creadas mediante el comando.

```shell
docker images
```
o
```shell
docker image ls
```

## Desplegar Conenedores de Imagenes Docker

1. Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker create volume" y "docker run" respectivos para crear los volumesnes de los contenedores e instancias las imagenes creadas y ejecutar los contenedores.
   
- **DHCP:**
- **DHCP-WLAN0**


- **DHCP-Eth1**



- **DHCP-Eth2**



- **DNS:**



- **FTP:**



- **HTTP:**



- **VoIP:**



- **Routing:**




2. Configurar los contenedores para VoIP y Routing, mediante el comando:

```shell
docker exec -it conainer_name sh
```
Donde:
- **conainer_name:** Es el nombre del contenedor.
- **VoIP:** Copiamos los archivos de configuración al directorio asociado al contenedor "voip_server" (Bind Mount).
Y reiniciamos el servicio mediante el comando:

```shell
docker restart voip_server
```



- **Routing:** Configuramos el direccionamiento para las interfaces "eth1" y "eth2".
Ingresamos a la terminal VTY de FRR, mediante el comando:

```shell
vtysh
```

Verificamos las configuraciones de direccionamiento mediante el comando:

```shell
show interface brief
```

Ingresaos al modo privilegiado de configuraciones mediante el comando:

```shell
configuration terminal
```

Configuramos las direcciones IPv4 asociadas a cada una de las interfaces, mediante los comandos:

```shell
interface interface_name
ip address IP_address/mask
no shutdown
```

Donde:
**interface_name:** Es el nombre de la interfaz asociada.
**IP_address:** Dirección IPv4.
**mask:** Mascara de Subred.

Salimos del modo privilegiado y verificamos las configuraciones de interfaz.


Guardamos las configuraciones mediante el comando

```shell
write
```

Mostramos las configuraciones guardadas en el archivo "zebra.conf" y "staticd.conf".



**NOTA: Ejecutar los servicios de DHCP "eth1" y "eth2", despues de ejecutar el contenedor para el servicio de Routing. Esto para evitar conflicto de direccionamiento de los contenedores DHCP.**

3. Verificar los contenedores en ejecución mediante el comando:

```shell
docker ps
```

4. Verificar los volumes de contenedores en ejecución mediante el comando:

```shell
docker volume ls
```


## Subir Imagenes a Registro Docker Hub
1. Iniciar sesión en Docker Hub con usuario y contraseña previamente creados, mediante los comandos:

```shell
docker login -u user_name
```
Donde:
- **user_name:** Es el nombre de usuario de Docker Hub.
2. Subir las imagenes de contenedores creadas mediante los comandos:
```shell
docker push  repository[:tag]
```
Donde:
- ** repository:** Es el nombre del repositorio y la etiquete de la imagen.
- **DHCP:**



- **DNS:**

  

- **FTP:**
  


- **HTTP:**
  

**NOTA: Se debe crear una cuenta en Docker Hub previamente y solicitar un Token para poder iniciar sesión y subir imagenes de contenedores docker.**
