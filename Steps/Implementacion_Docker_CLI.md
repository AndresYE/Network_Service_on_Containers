# Implementación Docker CLI
## Construcción de Imagenes Docker
### Paso 1: Abrir WinSCP
Como primer paso de la implementación se emplea el software WinSCP, el cual usa para la transferencia de los ficheros Dockerfile mediante conexión SSH.

![Paso 1 1 - docker_cli_docker_files_put_device_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/83218228-3b39-4b3b-a087-498ecd6f751e)
![Paso 1 2 - docker_cli_docker_files_put_device_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/4d3cc76a-b4e2-4ed0-ac2c-54baad6a87bc)


### Paso 2: Crear un Directorio "Docker" 
Crear un directorio "Docker" en la ruta "/home/pi/". Para agregar los archivos Dockerfile para cada uno de los servicios.

![Paso 3 1- docker_cli_docker_files_put_device_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/8df57446-a654-45a9-af86-2250775780e0)


### Paso 3: Colocar los Ficheros Dockerfile en el Directorio
Colocar los ficheros Dockerfile y dependencias en un directorio con el nombre del servicio.

![Paso 3 2 - docker_cli_docker_files_put_device_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/44868304-915f-4acc-b32a-08276ed47531)


### Paso 4: Iniciar Conexión SSH 
Iniciar una conexión SSH empleando el software Putty.

### Paso 5: Listar Directorio Docker
Realizar un listado del directorio "/home/pi/Docker"

![Paso 5 - docker_cli_docker_files_put_device_6](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/5e32ee0f-8abe-4f7f-81ce-ff3767ea0825)


### Paso 6: Construir Imagenes Docker
Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker build" respectivos para contruir las imagenes de los contenedores a partir de los ficheros Dockerfile y sus dependencias asociadas.
- **DHCP:**

![Paso 6 1 - docker_cli_dhcp_docker_build](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/388e0904-ef09-46c2-a6c4-b7f366b88532)

- **DNS:**
  
![Paso 6 2 - docker_cli_dns_docker_build](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/ec4f068f-2ca1-4ef7-9dcb-f0779c821958)

- **FTP:**

![Paso 6 3 - docker_cli_ftp_docker_build](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/1e83b7aa-cb2b-4e88-9a86-10039914bdee)

- **HTTP:**

![Paso 6 4 - docker_cli_http_docker_build](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/1721580a-5f59-4232-a43f-80cbd25a0497)

### Paso 7: Descargar Imagenes de Contenedores Docker
Descargar las imagenes de los contenedores asociados a los servicios de Routing y VoIP, del repositorio Docker Hub mediante el comando.

```shell
docker pull repository[:tag]
```
Donde:
- ** repository:** Es el nombre del repositorio y la etiquete de la imagen.
- **VoIP**

![Paso 7 1 - docker_cli_voip_dockerhub_imagen_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/b514d70a-fc04-4f54-bc21-94c7cb9e9c97)

![Paso 7 2 - docker_cli_voip_dockerhub_imagen_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/4d716d59-326a-4556-be0d-7286fb73e20a)

![Paso 7 3 - docker_cli_voip_docker_pull](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/b65c2835-71e9-4b70-8e24-e913c9186ceb)

- **Routing**

![Paso 7 4 - docker_cli_routing_dockerhub_imagen_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/5c000dcb-0a73-4ede-b5c5-94b1dd261179)

![Paso 7 5 - docker_cli_routing_dockerhub_imagen_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0d22676f-68d6-4283-8fdc-bdd771439d20)

![Paso 7 6 - docker_cli_routing_docker_pull](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/f959c840-f7db-4b41-9ec4-67255191499f)


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
