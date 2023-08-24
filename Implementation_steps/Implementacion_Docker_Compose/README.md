# Implementación Docker Compose

## Despligue de Solución Multicontenedor RPI-I
1. Eliminar los contenedores creados mediante Docker CLI, mediante el comando.
```shell
docker rm conatiner_name
```
Donde:
-*container_name: *Nombre del contenedor.

![docker_rm_services](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/51d1ca85-a47e-4a43-a08e-e5190194bcd1)

3.  Emplear el software WinSCP, para la transferencia de los ficheros YAML mediante conexión SSH a la placa RPI-I.
4. Crear un directorio "Docker_Compose" en la ruta "/home/pi/".
5. Colocar los ficheros YAML y dependencias en un directorio principal de Docker_Compose.
6. Iniciar conexión SSH empleando el software Putty.
7. Realizar un listado del directorio "/home/pi/Docker_Compose"
8. Ingresar al directorio "/home/pi/Docker_Compose" y ejecutar el comando desplegar los servicios medainte Docker Compose:
```shell
docker compose up
```
![docker_compose_up](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/b546df11-a380-49af-9180-a621eb5fbf82)


7. Verificar las imagenes creadas mediante el comando.
```shell
docker images
```
o
```shell
docker image ls
```

8. Configurar los conentedores para VoIP y Routing, mediante el comando:
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
![copy_voip_files](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/e5a0069b-b6f9-42ca-b391-35d31b57b67f)


- **Routing:** Configuramos el direccionamiento y enrutamiento para las interfaces "eth1", "eth2" y "eth3".
Habilitamos la opción ospf en el archivo de configuración "/etc/frr/daemons"
```shell
vi /etc/frr/daemons
opsfd=yes
```
Reiniciamos el contenedor mediante el comando:
```shell
docker restart routing_server_compose
```
Ingresamos a la terminal VTY de FRR, mediante el comando:
```shell
vtysh
```
Verificamos las configuraciones de direccionamiento mediante el comando:
```shell
show interface brief
```
Ingresar al modo privilegiado de configuraciones mediante el comando:
```shell
configuration terminal
```
Configuramos las direcciones IPv4 asociadas a cada una de las interfaces, mediante los comandos:
```shell
interface eth1
ip address 192.168.1.1/24
no shutdown
exit
interface eth2
ip address 192.168.2.1/24
no shutdown
exit
interface eth3
ip address 10.0.1.1/30 
no shutdown
exit
```

Salimos del modo privilegiado y verificamos las configuraciones de interfaz.

Guardamos las configuraciones mediante el comando
```shell
write
```
Configurarmos el enrutamiento OSPF mediante los comandos:
```shell
configure terminal
router ospf
	network 192.168.0.0/24 area 0.0.0.1
	network 192.168.1.0/24 area 0.0.0.1
	network 192.168.2.0/24 area 0.0.0.1
	network 10.0.1.0/30 area 0.0.0.1
exit
exit
```
Guardamos las configuraciones mediante el comando
```shell
write
```
Verificamos las configuraciones de enrutamiento mediante el comando:
```shell
show ip route
```

![routing_configuration_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/ab69c1a2-8828-4d19-9b93-ae3742d8b330)


**NOTA: Los servicios de DHCP "eth1" y "eth2", despues de ejecutar el contenedor para el servicio de Routing. Esto para evitar conflicto de direccionamiento de los contenedores DHCP.**
9. Verificar los contenedores en ejecución mediante el comando:
```shell
docker ps
```

10. Verificar los volumes de contenedores en ejecución mediante el comando:
```shell
docker volume ls
```
## Despligue de Solución Multicontenedor RPI-II
1. Como primer paso de la implementación se emplea el software WinSCP, para la transferencia de los ficheros YAML mediante conexión SSH a la placa RPI-I.

2. Crear un directorio "Docker_Compose" en la ruta "/home/pi/".
3. Colocar los ficheros YAML y dependencias en un directorio principal de Docker_Compose.
4. Iniciar conexión SSH empleando el software Putty.
5. Realizar un listado del directorio "/home/pi/Docker_Compose"
6. Ingresar al directorio "/home/pi/Docker_Compose" y ejecutar el comando para desplegar los servicios medainte Docker Compose:
```shell
docker compose routing_server_compose up
```
![docker_compose up_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/d38656e2-2d31-4de4-95a8-e92e9341eb00)

![docker_compose up_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0a464fa0-bd43-425a-bf18-5365a4959cf6)


7. Verificar las imagenes creadas mediante el comando.
```shell
docker images
```
o
```shell
docker image ls
```

8. Configurar los conentedores para VoIP y Routing, mediante el comando:
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

- **Routing:** Configuramos el direccionamiento y enrutamiento para las interfaces "eth1", "eth2" y "eth3".
Habilitamos la opción ospf en el archivo de configuración "/etc/frr/daemons"
```shell
vi /etc/frr/daemons
opsfd=yes
```
Reiniciamos el contenedor mediante el comando:
```shell
docker restart routing_server_compose
```
Ingresamos a la terminal VTY de FRR, mediante el comando:
```shell
vtysh
```
Verificamos las configuraciones de direccionamiento mediante el comando:
```shell
show interface brief
```
Ingresar al modo privilegiado de configuraciones mediante el comando:
```shell
configuration terminal
```
Configuramos las direcciones IPv4 asociadas a cada una de las interfaces, mediante los comandos:
```shell
interface eth1
ip address 192.168.4.1/24
no shutdown
exit
interface eth2
ip address 192.168.5.1/24
no shutdown
exit
interface eth3
ip address 10.0.1.2/30 
no shutdown
exit
```

Salimos del modo privilegiado y verificamos las configuraciones de interfaz.

Guardamos las configuraciones mediante el comando
```shell
write
```
Configurarmos el enrutamiento OSPF mediante los comandos:
```shell
configure terminal
router ospf
	network 192.168.4.0/24 area 0.0.0.1
	network 192.168.5.0/24 area 0.0.0.1
	network 10.0.1.0/30 area 0.0.0.1
exit
```
Guardamos las configuraciones mediante el comando
```shell
write
```
Verificamos las configuraciones de enrutamiento mediante el comando:
```shell
show ip route
```
Mostramos las configuraciones guardadas en el archivo "zebra.conf" y "staticd.conf".


**NOTA: Los servicios de DHCP "eth1" y "eth2", despues de ejecutar el contenedor para el servicio de Routing. Esto para evitar conflicto de direccionamiento de los contenedores DHCP.**
9. Verificar los contenedores en ejecución mediante el comando:
```shell
docker ps
```
10. Verificar los volumes de contenedores en ejecución mediante el comando:
```shell
docker volume ls
```
![docker_compose_ls](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/956f3e5e-e042-4d9e-838d-1d3b2f845adc)


