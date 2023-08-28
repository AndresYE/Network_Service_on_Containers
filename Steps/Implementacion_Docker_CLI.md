# Implementación Docker CLI
## Construcción de Imagenes Docker
### Paso 1: Abrir WinSCP
Como primer paso de la implementación se emplea el software WinSCP, el cual usa para la transferencia de los ficheros Dockerfile mediante conexión SSH.



### Paso 2: Crear un Directorio "Docker" 
Crear un directorio "Docker" en la ruta "/home/pi/". Para agregar los archivos Dockerfile para cada uno de los servicios.



### Paso 3: Colocar los Ficheros Dockerfile en el Directorio
Colocar los ficheros Dockerfile y dependencias en un directorio con el nombre del servicio.



### Paso 4: Iniciar Conexión SSH 
Iniciar una conexión SSH empleando el software Putty.



### Paso 5: Listar Directorio Docker
Realizar un listado del directorio "/home/pi/Docker"



### Paso 6: Construir Imagenes Docker
Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker build" respectivos para contruir las imagenes de los contenedores a partir de los ficheros Dockerfile y sus dependencias asociadas.
- **DHCP:**



- **DNS:**


- **FTP:**



- **HTTP:**



### Paso 7: Descargar Imagenes de Contenedores Docker
Descargar las imagenes de los contenedores asociados a los servicios de Rputing y VoIP, mediante el comando.

```shell
docker pull repository[:tag]
```
Donde:
- ** repository:** Es el nombre del repositorio y la etiquete de la imagen.
- **VoIP**

- **Routing**



### Paso 8: Listar Imágenes Docker 
Verificar las imagenes creadas mediante el comando.

```shell
docker images
```
o
```shell
docker image ls
```

## Desplegar Conenedores Docker

### Paso 1: Crear Instancias de Imágenes Docker
Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker create volume" y "docker run" respectivos para crear los volumesnes de los contenedores e instancias las imagenes creadas y ejecutar los contenedores.
   
- **DHCP:**
- **DHCP-WLAN0**


- **DHCP-Eth1**



- **DHCP-Eth2**



- **DNS:**



- **FTP:**



- **HTTP:**



- **VoIP:**



- **Routing:**




### Paso 2: Configuración de Servicios VoIP y Routing
#### VoIP:
Ingresamos al directorio asociado al servicio VoIP y copiamos los archivos de configuración al directorio asociado al contenedor "voip_server" (Bind Mount).
Y reiniciamos el servicio mediante el comando:

```shell
docker restart voip_server
```


#### Routing:
1. Ingresamos a la shell del contenedor Routing, mediante el comando:

```shell
docker exec -it conainer_name sh
```
Donde:
- **conainer_name:** Es el nombre del contenedor.

2. Configuramos el direccionamiento para las interfaces "eth1" y "eth2".
3. Ingresamos a la terminal VTY de FRR, mediante el comando:

```shell
vtysh
```

4. Verificamos las configuraciones de direccionamiento mediante el comando:

```shell
show interface brief
```

5. Ingresaos al modo privilegiado de configuraciones mediante el comando:

```shell
configuration terminal
```

6 Configuramos las direcciones IPv4 asociadas a cada una de las interfaces, mediante los comandos:

```shell
interface interface_name
ip address IP_address/mask
no shutdown
```

Donde:
**interface_name:** Es el nombre de la interfaz asociada.
**IP_address:** Dirección IPv4.
**mask:** Mascara de Subred.

7. Salimos del modo privilegiado y verificamos las configuraciones de interfaz.


8. Guardamos las configuraciones mediante el comando

```shell
write
```

9. Mostramos las configuraciones guardadas en el archivo "zebra.conf" y "staticd.conf".



**NOTA: Ejecutar los servicios de DHCP "eth1" y "eth2", despues de ejecutar el contenedor para el servicio de Routing. Esto para evitar conflicto de direccionamiento de los contenedores DHCP.**

### Paso 3: Listar Contenedores Docker
Verificar los contenedores en ejecución mediante el comando:

```shell
docker ps
```

### Paso 4: Listar Volumes Docker
Verificar los volumes de contenedores en ejecución mediante el comando:

```shell
docker volume ls
```


## Subir Imagenes a Registro Docker Hub
### Paso 1: Iniciar Sesión Docker
Iniciar sesión en Docker Hub con usuario y contraseña previamente creados, mediante los comandos:

```shell
docker login -u user_name
```

Donde:
- **user_name:** Es el nombre de usuario de Docker Hub.
### Paso 2: Subir Images Docker
Subir las imagenes de contenedores creadas mediante los comandos:

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
