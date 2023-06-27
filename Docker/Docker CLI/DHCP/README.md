# Servicio DHCP ISC

![dhcpd](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/42a0ef40-f14d-447f-9c46-591f3e705d22)

El Servicio DHCP ISC (Internet Systems Consortium) es una implementación de código abierto del Protocolo de Configuración Dinámica de Host (DHCP, por sus siglas en inglés). Proporciona una solución para asignar automáticamente direcciones IP y otros parámetros de red a dispositivos en una red local.

## Descripción

El Servicio DHCP ISC es una herramienta esencial en la administración de redes. Permite asignar y administrar de manera eficiente las direcciones IP, máscaras de subred, puertas de enlace, servidores DNS y otros parámetros de configuración en una red. El DHCP simplifica la administración manual de la configuración de red al automatizar el proceso de asignación de direcciones IP.

## Características

- Asignación automática de direcciones IP: El Servicio DHCP ISC asigna automáticamente direcciones IP a dispositivos en la red, eliminando la necesidad de configurar manualmente cada dispositivo individualmente.
- Renovación de arrendamiento: Los dispositivos DHCP renuevan periódicamente su arrendamiento de direcciones IP, lo que permite la reutilización eficiente de las direcciones IP en la red.
- Configuración de parámetros de red adicionales: Además de las direcciones IP, el DHCP ISC puede configurar otros parámetros de red, como la máscara de subred, la puerta de enlace predeterminada y los servidores DNS.
- Configuración dinámica basada en clases: Permite asignar diferentes rangos de direcciones IP y configuraciones de red basadas en clases o grupos específicos de dispositivos.
- Registro de eventos y seguimiento: El Servicio DHCP ISC puede registrar eventos importantes, como asignaciones de direcciones IP y renovaciones de arrendamiento, lo que facilita el seguimiento y la solución de problemas en la red.
- Integración con otros servicios de red: El DHCP ISC se integra con otros servicios de red como DNS, lo que permite la actualización dinámica de registros DNS para los dispositivos DHCP.

## Arquitectura

El Servicio DHCP ISC sigue una arquitectura cliente-servidor. Los dispositivos en la red que solicitan una dirección IP son los clientes, mientras que el servidor DHCP es responsable de asignar las direcciones IP y proporcionar la configuración de red correspondiente. El servidor DHCP mantiene una base de datos de direcciones IP disponibles y administra los arrendamientos de direcciones IP a los clientes.

## Tipos de implementaciones

El Servicio DHCP ISC puede implementarse en diferentes escenarios de red, incluyendo:

1. Redes domésticas y pequeñas empresas: Permite una fácil configuración y administración de direcciones IP en redes con un número limitado de dispositivos.
2. Redes empresariales: Proporciona una solución escalable y centralizada para administrar direcciones IP en redes empresariales de gran tamaño.
3. Proveedores de servicios de Internet (ISP): Los ISP pueden utilizar el Servicio DHCP ISC para asignar direcciones IP a sus clientes y proporcionar configuraciones de red personalizadas.

En resumen, el Servicio DHCP ISC es una herramienta esencial en la administración de redes, permitiendo una asignación automática y eficiente de direcciones IP y otros pará

# Archivos principales de DHCP

A continuación se muestran los archivos principales utilizados en el servicio DHCP, junto con sus descripciones:

| Archivo        | Descripción                                           |
| -------------- | ----------------------------------------------------- |
| dhcpd.conf     | Archivo de configuración principal del servidor DHCP.  |
| dhcpd.leases   | Archivo que registra los arrendamientos de direcciones IP realizados por el servidor DHCP. |
| dhcpd.pid      | Archivo que almacena el ID de proceso del servidor DHCP en ejecución. |
| dhcpd.options  | Archivo de opciones de configuración global del servidor DHCP. |
| dhcpd6.conf    | Archivo de configuración principal para DHCPv6 (Protocolo de Configuración Dinámica de Host versión 6). |
| dhcpd6.leases  | Archivo que registra los arrendamientos de direcciones IPv6 realizados por el servidor DHCPv6. |
| dhcpd6.options | Archivo de opciones de configuración global para DHCPv6. |
| dhclient.conf  | Archivo de configuración del cliente DHCP utilizado para configurar la interfaz de red de un cliente. |
| dhclient.leases | Archivo que registra los arrendamientos de direcciones IP obtenidos por el cliente DHCP. |
| dhclient6.conf | Archivo de configuración del cliente DHCPv6 utilizado para configurar la interfaz de red de un cliente IPv6. |

## Instrucciones de Uso

A continuación se detallan los pasos para construir la imagen y ejecutar los contenedores Docker para DHCPd:
1. **Construye la imagen**:
```shell
docker build -t andresye/dhcpd .
```
# DHCP 0 - Wlan0
1. **Crear Named Volumes**:
Volumen para archivos de arrendamiento DHCP (dhcpd.leases):
 ```shell
docker volume create dhcp_wlan0_leases_volumen
```
Volumen para logs del servicio DHCP (dhcpd.log):
 ```shell
docker volume create dhcp_wlan0_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run -dit -e IPV4_IFDHCP=wlan0 -e IPV4_SUBNET=192.168.0.0 -e MIN_IPV4_ADDRESS=192.168.0.10 -e MAX_IPV4_ADDRESS=192.168.0.100 -e IPV4_ROUTER=192.168.0.1 -v dhcp_wlan0_leases_volumen:/var/lib/dhcpd.leases -v dhcp_wlan0_logs_volumen:/var/log/dhcpd.log --net=host --name dhcp_server_eth0 andresye/dhcpd
```

# DHCP 0 - Wlan0
1. **Crear Named Volumes**:
Volumen para archivos de arrendamiento DHCP (dhcpd.leases):
 ```shell
docker volume create dhcp_wlan0_leases_volumen
```
Volumen para logs del servicio DHCP (dhcpd.log):
 ```shell
docker volume create dhcp_wlan0_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run -dit -e IPV4_IFDHCP=wlan0 -e IPV4_SUBNET=192.168.0.0 -e MIN_IPV4_ADDRESS=192.168.0.10 -e MAX_IPV4_ADDRESS=192.168.0.100 -e IPV4_ROUTER=192.168.0.1 -v dhcp_wlan0_leases_volumen:/var/lib/dhcpd.leases -v dhcp_wlan0_logs_volumen:/var/log/dhcpd.log --net=host --name dhcp_server_wlan0 andresye/dhcpd
```

# DHCP 1 - Eth0
1. **Crear Named Volumes**:
Volumen para archivos de arrendamiento DHCP (dhcpd.leases):
 ```shell
docker volume create dhcp_eth0_leases_volumen
```
Volumen para logs del servicio DHCP (dhcpd.log):
 ```shell
docker volume create dhcp_eth0_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run -dit -e IPV4_IFDHCP=eth0 -e IPV4_SUBNET=192.168.1.0 -e MIN_IPV4_ADDRESS=192.168.1.10 -e MAX_IPV4_ADDRESS=192.168.1.100 -e IPV4_ROUTER=192.168.1.1 -v dhcp_eth0_leases_volumen:/var/lib/dhcpd.leases -v dhcp_eth0_logs_volumen:/var/log/dhcpd.log --net=host --name dhcp_server_eth0 andresye/dhcpd
```

# DHCP 2 - Eth1
1. **Crear Named Volumes**:
Volumen para archivos de arrendamiento DHCP (dhcpd.leases):
 ```shell
docker volume create dhcp_eth1_leases_volumen
```
Volumen para logs del servicio DHCP (dhcpd.log):
 ```shell
docker volume create dhcp_eth1_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run -dit -e IPV4_IFDHCP=eth1 -e IPV4_SUBNET=192.168.2.0 -e MIN_IPV4_ADDRESS=192.168.2.10 -e MAX_IPV4_ADDRESS=192.168.2.100 -e IPV4_ROUTER=192.168.2.1 -v dhcp_eth1_leases_volumen:/var/lib/dhcpd.leases -v dhcp_eth1_logs_volumen:/var/log/dhcpd.log --net=host --name dhcp_server_eth1 andresye/dhcpd
```

# DHCP 3 - Eth2
1. **Crear Named Volumes**:
Volumen para archivos de arrendamiento DHCP (dhcpd.leases):
 ```shell
docker volume create dhcp_eth2_leases_volumen
```
Volumen para logs del servicio DHCP (dhcpd.log):
 ```shell
docker volume create dhcp_eth2_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run -dit -e IPV4_IFDHCP=eth2 -e IPV4_SUBNET=192.168.3.0 -e MIN_IPV4_ADDRESS=192.168.3.10 -e MAX_IPV4_ADDRESS=192.168.3.100 -e IPV4_ROUTER=192.168.3.1 -v dhcp_eth2_leases_volumen:/var/lib/dhcpd.leases -v dhcp_eth2_logs_volumen:/var/log/dhcpd.log --net=host --name dhcp_server_eth2 andresye/dhcpd
```
