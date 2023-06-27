# Docker DHCPd

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
docker run -dit -e IPV4_IFDHCP=wlan0 -e IPV4_SUBNET=192.168.0.0 -e MIN_IPV4_ADDRESS=192.168.0.10 -e MAX_IPV4_ADDRESS=192.168.0.100 -e IPV4_ROUTER=192.168.0.1 -v dhcp_wlan0_leases_volumen:/var/lib/dhcpd.leases -v dhcp_wlan0_logs_volumen:/var/log/dhcpd.log --net=host --name dhcp_server_eth0 andresye/dhcpd
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
