# Implementación
## Construcción de Imagenes Docker
1. Como primer paso de la implementación se emplea el software WinSCP, el cual usa para la transferencia de los ficheros Dockerfile mediante conexión SSH.
2. Crear un directorio "Docker" en la ruta "/home/pi/"".
3. Colocar los ficheros Dockerfile y dependencias en un directorio con el nombre del servicio.
4. Iniciar conexión SSH empleando el software Putty.
5. Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker build" respectivos para contruir las imagenes de los contenedores a partir de los ficheros Dockerfile y sus dependencias asociadas.
- **DHCP:**

![dhcp_docker_imagen](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/a5a89eef-0786-430b-93af-cc41feb267d7)

- **DNS:**

![dns_docker_imagen](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/d1e77bdd-d27e-47e0-bab3-049b9e0767a1)

- **FTP:**

![ftp_docker_imagen](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/6c1c44c4-6084-4b69-9584-cca52ab870bc)

- **HTTP:**

![http_docker_imagen](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/9bf7480b-ec4a-4056-87cf-4003fb28a7c3)

7. Descargar las imagenes de los contenedores asociados a los servicios de Rputing y VoIP, mediante el comando.
```shell
docker pull repository[:tag]
```
Donde:
- ** repository:** Es el nombre del repositorio y la etiquete de la imagen.
- **VoIP**
  
![voip_dockerhub_imagen_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/776f9bf7-7087-4e3f-87c8-aa0392829f80)

![voip_dockerhub_imagen_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/74ac234a-6b3d-40cc-a4da-63d3731344f7)

![voip_docker_imagen](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/b8f3b811-56dc-4f9b-8e98-b3ee8506742a)

- **Routing**

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
![docker_images](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/90b5bbeb-090d-4b44-9c98-25eedc1e40e1)

## Desplegar Conenedores de Imagenes Docker
1. Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker create volume" y "docker run" respectivos para crear los volumesnes de los contenedores e instancias las imagenes creadas y ejecutar los contenedores.
- **DHCP:**
- **DHCP-WLAN0**

![dhcp_wlan0_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/c9708e30-d396-4d3d-a227-a0e8a6dd858b)

- **DHCP-Eth1**

![dhcp_eth1_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/671c4d50-bf5d-4f70-a9d8-a93b0a08e89d)

- **DHCP-Eth2**

![dhcp_eth2_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/04b697bf-9e36-4cd5-8f24-d1159c47744a)

- **DNS:**

![dns_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/91c0d2b7-bbad-4113-93d2-e1458f4de13a)

- **FTP:**

![ftp_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/12050772-30b7-4061-827a-c49d280e9514)

- **HTTP:**

![http_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/951f2f77-5e91-4e64-a46a-22c6332169df)

- **VoIP:**

![voip_docker_run_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/17b07e40-7761-47e4-b22f-2d85757ea3d4)

- **Routing:**

![routing_docker_run](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0299fbc6-8f86-488e-aef0-98bdb8e11912)

2. Configurar los conentedores para VoIP y Routing, mediante el comando:
```shell
docker exec -it conainer_name sh
```
Donde:
-**conainer_name:** Es el nombre del contenedor.
- **VoIP:** Copiamos los archivos de configuración al directorio asociado al contenedor "voip_server" (Bind Mount).
Y reiniciamos el servicio mediante el comando:
```shell
docker restart voip_server
```
![voip_docker_run_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/a8597f00-eb73-4436-8c2e-eb825d9cd824)

- **Routing:** Configuramos el direccionamiento para las interfaces "eth1" y "eth2".
Ingresamos a la terminal VTY de FRR, mediante el comando:
```shell
vtysh
```
Verificamos las configuraciones de direccionamiento mediante el comando:
```shell
show interface brief
```

![routing_configuration_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0c5af8d2-e83b-4955-98c9-9eb5e4403763)
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

![routing_configuration_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/16459ce5-343e-467b-8bec-ade5ccde3430)
Guardamos las configuraciones mediante el comando
```shell
write
```
Mostramos las configuraciones guardadas en el archivo "zebra.conf" y "staticd.conf".

![routing_configuration_5](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/e0ebb505-b032-4ea7-9984-0ec05e77caf7)


**NOTA: Ejecutar los servicios de DHCP "eth1" y "eth2", despues de ejecutar el contenedor para el servicio de Routing. Esto para evitar conflicto de direccionamiento de los contenedores DHCP.**
3. Verificar los contenedores en ejecución mediante el comando:
```shell
docker ps
```

![docker_ps_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/08da0952-2329-4d75-bfbb-7021f12a3006)

4. Verificar los volumes de contenedores en ejecución mediante el comando:
```shell
docker volume ls
```

![docker_volume](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/75d13069-a0c7-4084-a2c1-ef54e747ffd5)

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

![dockerhub_dhcp_server](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/3dcf330b-d141-4c40-8e99-c14dacbcf2a6)

- **DNS:**
  
![dockerhub_dns_server](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/c5a11b92-6f43-4314-ba61-e3320df8a593)

- **FTP:**
  
![dockerhub_ftp_server](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/79b55bcd-c782-4685-9292-104e56e8e3eb)

- **HTTP:**
  
![dockerhub_http_server](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/b08e1fb5-1c15-48bb-97f8-5af76ec6b6f6)


**NOTA: Se debe crear una cuenta en Docker Hub previamente y solicitar un Token para poder iniciar sesión y subir imagenes de contenedores docker.
