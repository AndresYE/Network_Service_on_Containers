# Implementación
## Construcción de Imagenes Docker
1. Como primer paso de la implementación se emplea el software WinSCP, el cual usa para la transferencia de los ficheros Dockerfile mediante conexión SSH.
2. Crear un directorio "Docker" en la ruta "/home/pi/"".
3. Colocar los ficheros Dockerfile y dependencias en un directorio con el nombre del servicio.
4. Iniciar conexión SSH empleando el software Putty.
5. Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker build" respectivos para contruir las imagenes de los contenedores a partir de los ficheros Dockerfile y sus dependencias asociadas.
-**DHCP:**
   **DHCP-WLAN0**
![dhcp_wlan0_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/54e14e15-272b-40ef-8d5d-bc146ddd5c34)

   **DHCP-Eth1**
![dhcp_eth1_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/ea1c6615-6803-46f9-ba13-94e522827dff)

   **DHCP-Eth2**
![dhcp_eth2_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/25900730-edc7-4503-be90-7a975f803054)

-**DNS:**
![dns_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/9892d919-1178-4d27-92e3-cb02be183664)

-**FTP:**
![ftp_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/54eab014-65e8-404c-b1ed-9f3d360ec2a5)

-**HTTP:**
![http_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/a9044c56-ac3d-4ea6-964e-2620b77b9062)

7. Descargar las imagenes de los contenedores asociados a los servicios de Rputing y VoIP, mediante el comando.
```shell
docker pull repository[:tag]
```
Donde:
- ** repository:** Es el nombre del repositorio y la etiquete de la imagen.
-**VoIP**
![voip_dockerhub_imagen_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/776f9bf7-7087-4e3f-87c8-aa0392829f80)

![voip_dockerhub_imagen_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/74ac234a-6b3d-40cc-a4da-63d3731344f7)

![voip_docker_imagen](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/b8f3b811-56dc-4f9b-8e98-b3ee8506742a)

-**Routing**
![routing_dockerhub_imagen_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/ee33ccf2-76a6-4b24-911f-e3d5222c56fb)

![routing_dockerhub_imagen_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/83b0d38f-c7bb-4042-a8ad-13085f4a6ffa)

![routing_docker_imagen](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0a7da298-d5d1-4a71-8162-3ee0565cf3a2)

7. Verificar las imagenes creadas mediante el comando.
```shell
docker images
```
o
```shell
docker image ls
```
## Desplegar Conenedores de Imagenes Docker
1. Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker run" respectivos para instancias las imagenes creadas y ejecutar los contenedores.
2. Verificar los contenedores en ejecución mediante el comando:
```shell
docker ps
```
3. Verificar los volumes de contenedores en ejecución mediante el comando:
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

**NOTA: Se debe crear una cuenta en Docker Hub previamente y solicitar un Token para poder iniciar sesión y subir imagenes de contenedores docker.
