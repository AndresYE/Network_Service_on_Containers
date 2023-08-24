# Implementación Docker Compose

## Despligue de Solución Multicontenedor RPI-I
1. Como primer paso de la implementación se emplea el software WinSCP, para la transferencia de los ficheros YAML mediante conexión SSH a la placa RPI-I.

2. Crear un directorio "Docker_Compose" en la ruta "/home/pi/".
3. Colocar los ficheros YAML y dependencias en un directorio principal de Docker_Compose.

  
4. Iniciar conexión SSH empleando el software Putty.
  
5. Realizar un listado del directorio "/home/pi/Docker_Compose"


6. Ingresar al directorio "/home/pi/Docker_Compose" y ejecutar el comando desplegar los servicios medainte Docker Compose:
```shell
docker compose up
```

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

