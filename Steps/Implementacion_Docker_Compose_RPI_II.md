# Implementación Docker Compose
## Despligue de Solución Multicontenedor RPI-II

### Paso 1: Eliminar Conentenedores Previos
Eliminar los contenedores creados mediante Docker CLI, mediante el comando.

```shell
docker rm conatiner_name
```
Donde:
- **container_name:** Nombre del contenedor.

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
docker compose routing_server_compose up
```

![Paso 7 1 - rpi_II_docker_compose_docker_compose_up](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/08d13a59-6ed0-43bb-952f-6c92f9c7e31f)

![Paso 7 2 - rpi_II_docker_compose_docker_compose_up](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/2074028e-3d66-4ddb-a4fe-ad505edfd38a)


### Paso 8: Listar Imágenes Docker
Verificar las imagenes creadas mediante el comando.

```shell
docker images
```
o
```shell
docker image ls
```

### Paso 9: Configurar el conentedor para Routing.

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

![Paso 9 2 7  - docker_compose_servicio_routing_configuracion_direccionamiento_estatico](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/b79dab38-4cd2-49f1-a07c-3c11ece01eab)

8. Salimos del modo privilegiado y verificamos las configuraciones de interfaz.

![Paso 9 2 8 - docker_compose_servicio_routing_direccionamiento_estatico_0](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/544395c8-f79c-4a3f-89d3-98c849eefef1)

9. Guardamos las configuraciones mediante el comando:

```shell
write
```

10. Configurarmos el enrutamiento OSPF mediante los comandos:

```shell
configure terminal
router ospf
	network 192.168.4.0/24 area 0.0.0.1
	network 192.168.5.0/24 area 0.0.0.1
	network 10.0.1.0/30 area 0.0.0.1
exit
```

1. Guardamos las configuraciones mediante el comando:

```shell
write
```

12. Verificamos las configuraciones de enrutamiento mediante el comando:

```shell
show ip route
```

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
![Paso 12 - docker_compose_ls](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/5b41152b-65af-4971-8e88-b19a83ea4b45)
