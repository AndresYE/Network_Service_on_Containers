# FRRouting

![frrouting](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/612c644b-c415-432c-9636-9944b957b3fc)

FRRouting, también conocido como FRR, es un conjunto de protocolos de enrutamiento de código abierto y de alta calidad que se utilizan para construir redes de área amplia (WAN) y redes de área local (LAN) de tamaño mediano a grande.

## Archivos Principales de FRRouting

A continuación se muestra una tabla que describe los archivos principales utilizados en FRRouting:

| Archivo       | Descripción                                           |
|---------------|-------------------------------------------------------|
| frr.conf      | Archivo de configuración principal de FRRouting        |
| daemons       | Archivo que especifica los módulos y protocolos a cargar por FRRouting |
| vtysh.conf    | Archivo de configuración para el shell de administración de FRRouting (vtysh) |
| zebra.conf    | Archivo de configuración para el daemon Zebra          |
| ospfd.conf    | Archivo de configuración para el daemon OSPF           |
| bgpd.conf     | Archivo de configuración para el daemon BGP            |
| isisd.conf    | Archivo de configuración para el daemon IS-IS          |
| ripd.conf     | Archivo de configuración para el daemon RIP            |
| eigrpd.conf   | Archivo de configuración para el daemon EIGRP          |
| pimd.conf     | Archivo de configuración para el daemon PIM            |
| nfsv3.conf    | Archivo de configuración para el daemon NFSv3          |
| nfsv4.conf    | Archivo de configuración para el daemon NFSv4          |
| ripngd.conf   | Archivo de configuración para el daemon RIPng          |
| vrrpd.conf    | Archivo de configuración para el daemon VRRP           |
| ldpd.conf     | Archivo de configuración para el daemon LDP            |
| pbrd.conf     | Archivo de configuración para el daemon PBR            |
| ospf6d.conf   | Archivo de configuración para el daemon OSPFv3         |
| bgpvpn.conf   | Archivo de configuración para el daemon BGP VPN        |
| lldpd.conf    | Archivo de configuración para el daemon LLDP           |
| ptpd.conf     | Archivo de configuración para el daemon PTP            |

# Docker Routing

## Instrucciones de Uso

A continuación se detallan los pasos para ejecutar los contenedores Docker para routing:

# FRRouting
1. **Crear Named Volumes**:
Volumen para las configuraciones del servicio Routing (/etc/frr/):
 ```shell
docker volume create routing_config_volumen 
```

2. **Ejecuta el contenedor**:
```shell
docker run --restart=always --privileged=true -dit --net host -v routing_config_volumen:/etc/frr/ --name routing_server frrouting/frr:v8.4.0
```
