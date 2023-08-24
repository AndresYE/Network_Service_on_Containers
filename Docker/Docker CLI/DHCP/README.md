# Servicio DHCP ISC

![dhcpd](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/42a0ef40-f14d-447f-9c46-591f3e705d22)

El Servicio DHCP ISC (Internet Systems Consortium) es una implementación de código abierto del Protocolo de Configuración Dinámica de Host (DHCP, por sus siglas en inglés). Proporciona una solución para asignar automáticamente direcciones IP y otros parámetros de red a dispositivos en una red local.

## Archivos principales de DHCP

A continuación se muestran los archivos principales utilizados en el servicio DHCP, junto con sus descripciones:

| Archivo        | Descripción                                           |
| -------------- | ----------------------------------------------------- |
| dhcpd.conf     | Archivo de configuración principal del servidor DHCP.  |
| dhcpd.leases   | Archivo que registra los arrendamientos de direcciones IP realizados por el servidor DHCP. |
| dhcpd.lease~   | Copia de respaldo del archivo que registra los arrendamientos de direcciones IP realizados por el servidor DHCP. (Nota: Este archivo no debe modificarse manualmente y se utiliza para recuperación en caso de fallos) |
| dhcpd6.conf    | Archivo de configuración principal para DHCPv6 (Protocolo de Configuración Dinámica de Host versión 6). |
| dhcpd6.leases  | Archivo que registra los arrendamientos de direcciones IPv6 realizados por el servidor DHCPv6. |
| dhcpd6.lease~  | Copia de respaldo del archivo que registra los arrendamientos de direcciones IPv6 realizados por el servidor DHCPv6. (Nota: Este archivo no debe modificarse manualmente y se utiliza para recuperación en caso de fallos) |

## Instrucciones de Uso

A continuación se detallan los pasos para construir la imagen y ejecutar los contenedores Docker para DHCPd:
1. **Construye la imagen**:
```shell
docker build -t andresye/dhcpd .
```

# DHCP 1 - Wlan0
1. **Crear Named Volumes**:
Volumen para archivos de arrendamiento DHCP (dhcpd.leases):
 ```shell
docker volume create dhcp_wlan0_leases_volumen
```

2. **Ejecuta el contenedor**:
```shell
docker run --restart=always -dit -e IFDHCP=wlan0 -e IPV4_SUBNET=192.168.0.0 -e MIN_IPV4_ADDRESS=192.168.0.10 -e MAX_IPV4_ADDRESS=192.168.0.100 -e IPV4_GATEWAY=192.168.0.1 -e IPV4_GATEWAY_MASK=255.255.255.0 -v dhcp_wlan0_leases_volumen:/var/lib/dhcp --net=host --name dhcp_server_wlan0 andresye/dhcpd
```

# DHCP 2 - Eth1
1. **Crear Named Volumes**:
Volumen para archivos de arrendamiento DHCP (dhcpd.leases):
 ```shell
docker volume create dhcp_eth1_leases_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run --restart=always -dit -e IFDHCP=eth1 -e IPV4_SUBNET=192.168.1.0 -e MIN_IPV4_ADDRESS=192.168.1.10 -e MAX_IPV4_ADDRESS=192.168.1.100 -e IPV4_GATEWAY=192.168.1.1 -e IPV4_GATEWAY_MASK=255.255.255.0 -v dhcp_eth1_leases_volumen:/var/lib/dhcp --net=host --name dhcp_server_eth1 andresye/dhcpd
```

# DHCP 3 - Eth2
1. **Crear Named Volumes**:
Volumen para archivos de arrendamiento DHCP (dhcpd.leases):
 ```shell
docker volume create dhcp_eth2_leases_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run --restart=always -dit -e IFDHCP=eth2 -e IPV4_SUBNET=192.168.2.0 -e MIN_IPV4_ADDRESS=192.168.2.10 -e MAX_IPV4_ADDRESS=192.168.2.100 -e IPV4_GATEWAY=192.168.2.1 -e IPV4_GATEWAY_MASK=255.255.255.0 -v dhcp_eth2_leases_volumen:/var/lib/dhcp --net=host --name dhcp_server_eth2 andresye/dhcpd
```
