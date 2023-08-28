# Implementación Docker Compose

## Despligue de Solución Multicontenedor para RPI-I
### Paso 1: Eliminar Conentenedores Previos
Eliminar los contenedores creados mediante Docker CLI, mediante el comando.

```shell
docker rm conatiner_name
```
Donde:
- **container_name:** Nombre del contenedor.

![Paso 1 - rpi_I_docker_compose_docker_rm_services](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/31f19dc3-28d5-4394-9a97-cf1853c29a56)


### Paso 2: Abrir WinSCP
Emplear el software WinSCP, para la transferencia de los ficheros YAML mediante conexión SSH a la placa RPI-I.
### Paso 3: Crear un Directorio "Docker_Compose"
Crear un directorio "Docker_Compose" en la ruta "/home/pi/".
### Paso 4: Colocar los Ficheros YAML en el Directorio
Colocar los ficheros YAML y dependencias en un directorio principal de Docker_Compose.
### Paso 5: Iniciar Conexión SSH
Iniciar conexión SSH empleando el software Putty.
### Paso 6: Listar Directorio Docker
Realizar un listado del directorio "/home/pi/Docker_Compose"
### Paso 7: Desplegar Contenedores Mediante Docker Compose
Ingresar al directorio "/home/pi/Docker_Compose" y ejecutar el comando desplegar los servicios medainte Docker Compose:

```shell
docker compose up
```

![Paso 7 - rpi_I_docker_compose_docker_compose_up](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/c0de5903-2ba5-44ab-899f-deea0550b410)


### Paso 8: Listar Imágenes Docker
Verificar las imagenes creadas mediante el comando.

```shell
docker images
```
o
```shell
docker image ls
```

### Paso 9: Configurar los conentedores para VoIP y Routing.

#### VoIP
Copiamos los archivos de configuración al directorio asociado al contenedor "voip_server" (Bind Mount).
Y reiniciamos el servicio mediante el comando:

```shell
docker restart voip_server_compose
```

![Paso 9 1 - docker_compose_servicio_servicio_voip_copy_voip_files](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/a09b2523-07a2-4dd1-b42c-3600724d3f65)

#### Routing
Ingresar al contenedor mediante el comando:
```shell
docker exec -it routing_server_compose sh
```

1. Configuramos el direccionamiento y enrutamiento para las interfaces "eth1", "eth2" y "eth3".
2. Habilitamos la opción ospf en el archivo de configuración "/etc/frr/daemons"

```shell
vi /etc/frr/daemons
	opsfd=yes
```
3. Reiniciamos el contenedor mediante el comando:

```shell
docker restart routing_server_compose
```

4. Ingresamos a la terminal VTY de FRR, mediante el comando:

```shell
vtysh
```

5. Verificamos las configuraciones de direccionamiento mediante el comando:

```shell
show interface brief
```

6. Ingresar al modo privilegiado de configuraciones mediante el comando:

```shell
configuration terminal
```

7. Configuramos las direcciones IPv4 asociadas a cada una de las interfaces, mediante los comandos:

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

8. Salimos del modo privilegiado y verificamos las configuraciones de interfaz.

![Paso 9 2 8 - docker_compose_servicio_routing_direccionamiento_estatico_0](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/79abc3bf-d12a-4909-9e17-635858100286)

9. Guardamos las configuraciones mediante el comando:

```shell
write
```

10. Configurarmos el enrutamiento OSPF mediante los comandos:

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

11. Guardamos las configuraciones mediante el comando:

```shell
write
```

12. Verificamos las configuraciones de enrutamiento mediante el comando:

```shell
show ip route
```

![Paso 9 2 13 - docker_compose_servicio_routing_running_config](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/91a9405f-76ab-4bc7-97bd-e9d7cc57b369)


**NOTA: Los servicios de DHCP "eth1" y "eth2", despues de ejecutar el contenedor para el servicio de Routing. Esto para evitar conflicto de direccionamiento de los contenedores DHCP.**
### Paso 10: Listar Desplieges Docker Compose
Verificar los despligues Docker Compose en ejecución mediante el comando:

```shell
docker compose ls
```

### Paso 11: Listar Contenedores Docker
Verificar los contenedores en ejecución mediante el comando:

```shell
docker ps
```
### Paso 12:  Verificar los volumes de contenedores en ejecución mediante el comando:

```shell
docker volume ls
```

![Paso 12 - docker_compose_ls](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/faa4559c-58d9-48ef-8e2d-678eb108f3ab)
